%% UNM Sapflow Filtering Tools
% Preamble 
% This script represents a body of code generated by Jen Plaut, and
% modified by Laura Gonzales. Additions to improve the plotting interface
% are being contributed by Dan Krofcheck (3-10-14)

%% Set the paths

% Set path to find raw sapflux data files
raw_sap_path = 'C:\Users\greg\Desktop\sapflow_test_data\';
% Set path to output QA/QC'd sapflux data files
qc_sap_path = 'C:\Users\greg\Desktop\sapflow_test_data\output\';
% Set path to find ameriflux daily file for the site
af_path = 'C:\Research_Flux_Towers\Ameriflux_files\';

% Add the figure script path
addpath('figure_scripts\');

%% Read in the required datasets
% This script leverages hand compiled time series of sap flow measurements
% on a site specific basis (PJ Control and PJ Girdle). Secondarily, the
% script reads in 30 minute data for the respective site, and joins the
% data with the manually entered sapflow data.

% Read in the manually created sapflow file, and determine the start and
% stop date of the data
ltsdata = readtable( [raw_sap_path 'Input_PJc_continuo_todo_csv.csv'], 'Delimiter', ',' );
startYear = min(ltsdata.Year);
stopYear = max(ltsdata.Year);
ts_stop = length(ltsdata.Year);

af_data = get_af_data( 'Mpj', af_path, startYear, stopYear );

% Specify variables of interest to be extracted from the ameriflux data
RH = af_data.RH_F;
VPD = af_data.VPD_F;
AirTC = af_data.TA_F;
ShortWave = af_data.SW_IN_F;
Precip = af_data.P_F;

% PJ Control has 5 Pinon sapflow sensors, and 5 Juniper sapflow sensors

%ltsdata = dlmread('Input_PJc_continuo_todo_csv.csv',',',1,1);% AQUI PASA DE LA PRIMERA COLUMNA Y DE LA PRIMERA LINEA

%METO COMO INPUT FILE LAS COLUMNAS DE TIME STAMP Y LOS SAPFLOW DATA
%DIRECTAMENTE(ASI QUE PASO DE TODAS LAS LINEAS SIGUIENTES)

%ts_cols = plotdata(:,1:3);%esto simplemente identifica los datos temporales[todas las filas (:), columnas de la 1 a la 3 (1:3)]
%run make_Litvak_timestamp; % generates 11-column "lts" en base a ts_col este programa crea 11 columnas temporales
%TENGO UN PROBLEMA CON Litvak_timestamp QUE ME GENERA FALOS EL DIA 1 DE
%ENERO DE CADA A�O!!!,LO CAMBIO MANUALMENTE POR EL MOMENTO.
%%
% Not sure why so much data is removed here...
%ltsdata_1(1:96385,12:31) = {NaN};

% Subset the Granier data
%instead of ltsdata_1(:,1:11), use ltsdata_1(number of row I want to start
%on:ts_stop,1:11);
lts=  ltsdata(:,1:11); %clear lts; %esto coje los datos unicamente de sapflow (ahora 76:95 con nuevo archivo), y crea un nuevo archivo, ltsdata, CON LAS lts COLUMNAS que cr� make_Litvak_timestamp Y LOS DATOS DE FLUJO DE ESAS FECHAS que estaban en plotdata 
%lts = ltsdata_1(96386:ts_stop,1:11);

%G_raw = ltsdata_1(number of row I want to start on:ts_stop,:);
G_raw = ltsdata;
%G_raw = ltsdata_1(96386:ts_stop,:);

% Convert tables back to arrays for the time being.. quick and dirty, just
% to make it work.
G_raw = table2array(G_raw);
lts = table2array(lts);

% Generate means and standard errors for raw mV data
Pmean_raw = nanmean(G_raw(:,12:21),2); % mean PIED mV (promedia todas las medidas de la columna 12 a la 21 ue corresponde a las dos mediciones por pino)
cols = G_raw(:,12:21)';
Pn_raw = size(G_raw(:,12:21),2)-sum(isnan(cols(:,:)))'; % PIED n
colstd = nanstd(cols);
Pste_raw = colstd' ./ sqrt(Pn_raw); % PIED mV standard error (esta y las 2 filas anteriores es para que no use los valores NaN en el calculo de la desviacion standard)
clear cols;
clear colstd;
% This is to create un dato promedio de todos los juniperus y todos los
% sensores:
Jmean_raw = nanmean(G_raw(:,22:31),2); % mean JUMO mV
cols = G_raw(:,22:31)';
Jn_raw = size(G_raw(:,22:31),2)-sum(isnan(cols(:,:)))'; % JUMO n
colstd = nanstd(cols);
Jste_raw = colstd' ./ sqrt(Jn_raw); % JUMO mV standard error
clear cols;
clear colstd;

G_clean = G_raw;

% Broad-stroke screening for high/low mV.  Previously we have used 0.15 to
% 0.5 mV as "good" data but there appear to be some plausible points below
% 0.15 so this maybe should be tweaked. Esto es para quitar los datos que
% claramente son erroneos segun unas boundaries or thresholds
y = G_raw(:, 12:31); % subset sapflow columns
z = find(y >=0.6 | y <= 0.05); % ID high and low mV values ESTOS SON LOS THRESHOLDS
y(z) = NaN;  %make those ones NaNs
G_clean(:, 12:31) = y; %replace values in original matrix

% Remove bad data points - cherry picking by hand! Plot the traces for each
% probe and use the data cursor in the figure window to identify bad
% points, then add those points to the arrays here.  So if T1 probe A had
% bad data at PJ timestamp 2,3,4,7, and 10, I would enter:
% G_clean([2:4 7 10],12)
% Note: in order for the data cursor to display adequate precision, go to 
% MATLAB7\toolbox\matlab\graphics\@graphics\@datacursor, open
% default_getDatatipText.m and in line 31, change DEFAULT_DIGITS = 4; to 7
% or 8 and save it.(esta nota es solo para decirte que a partir de cierto
% numero de datos el numero que te sale en la grafica esta inclompleto pq
% eran numeros demasiado grandes Y QUE SI CAMBIAS LA CONFIGURACION COMO ELLA DICE TE SALDRA EL NUMERO COMPLETO)
% Aqui es donde hay que poner the numbers tht you want to remove manually

% TP1A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96865:97201 97202:99216 99793:99936 100033:100416 104305:104400],12) = NaN;
% TP1B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:97201 97489:97680 98449:98833 99793:99936 104305:104400 104497:104544],13) = NaN;
% TP2A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:97201 98017:98112 99793:99936 104305:104400 104497:104544],14) = NaN;
% TP2B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:98448 98881:102240 102289:102528 102577:102816 102913:103248 103633:103920 104257:104352 104449:104688 105025:105072],15) = NaN;
% TP3A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96484:96494 96865:98353 99121:99264 99793:99936 104257:104352 104497:104544],16) = NaN;
% TP3B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:96960 97153:97201 97537:99216 99793:99936 104257:104352 104497:104544],17) = NaN;
% TP4A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:96960 97153:97201 97489:97680 97777:98112 98641:98928 99793:99936 100897:100992 103633:103680 104257:104352 104449:104544],18) = NaN;
% TP4B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:98112 98641:98928 99793:99936 100897:100992 103633:103680 104257:104352 104449:104544],19) = NaN;
% TP5A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96481:96624 96865:97201 97202:98448 99169:99216 99793:99936 104257:104352 104449:104592],20) = NaN;
% TP5B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96481:96624 96865:97201 97585:97680 99169:99216 99793:99936 104257:104352 104449:104592],21) = NaN;
% TJ1A 
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:97201 97489:97680 98017:98112 98348:98355 98468:98469 98564:98565 98611:98613 98659:98660 98707:98709 98737:98832 98851:98854 98947:98951 98996:98998 99044:99046 99092:99093 99140:99141 99169:99216 103633:103680 104257:104352 104449:104544],22) = NaN;
% TJ1B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96865:98112 98779:98780 98840:98841 98933:98934 99985:100272 100514:100516 100535:100536 101147:101148 102738:102739 103633:103680 104257:104352 104449:104544 105025:105072],23) = NaN;
% TJ2A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:97201 98017:98112 99191:99192 103633:103920 104257:104352 104449:104592 105025:105072],24) = NaN;
% TJ2B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:98112 98222:98227 98257:98448 98530:98534 98577:98581 98624:98628 98768:98771 98817:98818 99265:99984 100241:100243 100276:100292 100534:100535 101540:101546 103633:103920 104257:104352 104449:104688 105025:105072],25) = NaN;
% TJ3A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96865:97680 98678:98684 102943:102944 103633:103680 104257:104352 104449:104544],26) = NaN;
% TJ3B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:97680 99526:99528 99574:99576 99622:99624 99670:99671 103633:103680 104257:104352 104449:104544],27) = NaN;
% TJ4A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:99216 99457:99504 99793:99888 104257:104447 104525:104526],28) = NaN;
% TJ4B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96865:97680 98777:98782 99457:99504 99169:99216 101261:101263 101987:101989 104525:104526],29) = NaN;
% TJ5A
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:97201 97489:97680 98017:98112 99793:99840 103633:103728 104257:104352 104449:104544],30) = NaN;
% TJ5B
 G_clean([102241:102288 102529:102576 102817:102912 103249:103632 103921:104256 104353:104448 104689:105024 105073:105216 96385:97201 97489:97680 98017:98112 103633:103728 104257:104352 104449:104544],31) = NaN;

 
% Generate means and standard errors for cleaned mV data (only with clean
% data)
Pmean_clean = nanmean(G_clean(:,12:21),2); % mean PIED mV (PIED IS PINUS EDULIS)
cols = G_clean(:,12:21)';
Pn_clean = size(G_clean(:,12:21),2)-sum(isnan(cols(:,:)))'; % PIED n
colstd = nanstd(cols);
Pste_clean = colstd' ./ sqrt(Pn_clean); % PIED mV standard error
clear cols;
clear colstd;
Jmean_clean = nanmean(G_clean(:,22:31),2); % mean JUMO mV (JUMO is Juniperus monosperma)
cols = G_clean(:,22:31)';
Jn_clean = size(G_clean(:,22:31),2)-sum(isnan(cols(:,:)))'; % JUMO n
colstd = nanstd(cols);
Jste_clean = colstd' ./ sqrt(Jn_clean); % JUMO mV standard error
clear cols;
clear colstd;

% generate index cols, one row for each PJ Day
day_index = nan(max(G_clean(:,9)),11);%ESTO CREA UNA MATIZ DE NAN de dimensiones(lineas =el maximo de Litvakdoy que es la columna 9 y columnas=11)
for i = min(G_clean(:,9)):max(G_clean(:,9)) % originalemnte:for i = min(G_clean(:,9)):max(G_clean(:,9)), pero entonces fallaba para el dia 1 de 2008 asi que he quitado el +1
    day_index(i,:) = G_clean(find(G_clean(:,9)==i & G_clean(:,6)==0),1:11);
end

% Find the dTmax for each day, along with the timestamp and hour at which
% it occurs.  Start by pre-allocating empty arrays.
dTmax=cat(2, day_index(:,:), NaN(max(G_clean(:,9)),30));
ts_dTmax = dTmax;
hour_dTmax = dTmax;
over_dTmax_sum = dTmax; % this is the number of points during each day that are 
% over the dTmax. Note that this covers the entire 24-hour period.
% Fill the arrays:con todo este loop que sigue rellenamos los tres arrays en donde te
% dicen el valor maximo(dtmax)la hora del maximo (hourdtmax), y el numero
% de momentos en el dia que tienen un valor mayor al maximo(overdtmax)
for i = min(G_clean(:,9)):max(G_clean(:,9)) % i is Litvak Day
    night = find(G_clean(:,9)==i & G_clean(:,4)>= 0 & G_clean(:,4) <= 23); % b/c hr is 0-23, it's taking dTmax from the whole day (PERO SI QUEREMOS CAMBIARLO A QUE SEA SOLO LA NOCHE SE PUEDE CAMBIAR cambiando el cero y el 24 para poner las horas entre las que queremos calcularlo)
    wholeday = find(G_clean(:,9)==i);
    if length(night)>1
        for j = 12:31 % identify array for each probe
        h = G_clean(night,j); % pull out each day:probe array separately
        m = find(h==max(h)); % find position of max within h
            if nansum(h)>0 
                dTmax(i,j) = max(h(m)); % fill arrays
                ts_dTmax(i,j) = floor(median(G_clean(night(m),11))); 
                hour_dTmax(i,j) = floor(median(G_clean(night(m),4)));
                over_dTmax_sum(i,j) = sum(G_clean(wholeday,j)>max(h(m)));%ESTO TE DIRIA CUANTOS PUNTOS EN EL DIA DAN VALORES MAS ALTOS O IGUALES QUE atmax
            end;
        end;
        clear h; clear m;
    end;
    clear night;
end;

% ID which points exactly are greater than dTmax. Might be just as easy to
% use code at the bottom of this script to find the timestamp associated
% with a given PJday and zoom in on that range in Figure 6. In the output
% table, over_dTmax, "2" means mV > dTmax, "1" means mV = dTmax, 
% "0" means mV < dTmax

over_dTmax = [lts(:,:) nan(length(G_clean),20)];
for i = 1:length(G_clean)
    day = G_clean(i,9);
    for j = 12:31
        if G_clean(i,j)>dTmax(day,j)
            over_dTmax(i,j)=2;
        elseif G_clean(i,j)==dTmax(day,j)
            over_dTmax(i,j)=1;
        elseif G_clean(i,j)<dTmax(day,j)
            over_dTmax(i,j)=0;
        end
    end
end

% Set a bunch of plotting parameters
probe =19; % starting *column* of two probes of interest out of the 20 % esto va de a ir de numero impar a numero impar pq el 1 me ense;a probs 1 y 2 que son a y b del mismo arbol.ESTO ES LO QUE TENGO QUE CAMBIAR PARA IR VIENDO DE ARBOL EN ARBOL
% Granier probe columns, so valid values are 1-20 - if odd #'s are used it 
% will be two probes from the same tree
x = 1:max(G_raw(:,11)); % x-axis uses PJ timestamp
a = G_raw(:,11+probe:12+probe); % pull out raw data for probe A + B
b = G_clean(:,11+probe:12+probe); % pull out clean data for probe A + B
% Comment out the appropriate mean
if probe <= 10
    c = Pmean_clean(:,:); % use this if you're looking at pinon probes
elseif probe >= 11 & probe<=20 %ESTO ES SOLO PARA QUE LOS JUNIPERUS TE LOS COMPARE CON LA MEDIA DEL JUNIPERUS , ASI QUE SI TENEMOS MAS ARBOLES QUE 5 PINOS Y 5 JUNIPERUS HABRA QUE CAMBIAR ESTE NUMERO
    c = Jmean_clean(:,:); % use this if you're looking at juniper probes
end

d = Jmean_clean(:,:);
e = 1:max(dTmax(:,9)); % x-axis for PJ day
f = dTmax(:,11+probe:12+probe); % pull out dTmax data for probe A + B
g = over_dTmax_sum(:,11+probe:12+probe);
h = over_dTmax(:,11+probe:12+probe);
% These are the timestamps that delineate the subplots in Figure 1
max_timestamp = max(G_clean(:,11));
start_timestamp = 24897; %Es la timestamp de cuando comienzan los datos de flujo de sabia en pinus
ts_range = max_timestamp-start_timestamp; % the timespan back to when Granier data started
ts_range_3 = ceil(ts_range/3);
time1 = start_timestamp; 
time2 = start_timestamp+ts_range_3; 
time3 = start_timestamp+(2*ts_range_3);  
% The y-axis is bounded by max and min of the *cleaned* data so that wild
% outliers don't make it impossible to see patterns
top = max(max(b(time1:time2,1:2)));
bottom = min(min(b(time1:time2,1:2)));
% These are the timestamps that delineate the subplots in Figure 1
%%%%%%%%%% Reinstate the below once running full dataset
% time1 = 23800; 
% time2 =  27563; 
% time3 = 31326;
%%%%%%%%%% Remove this once running full dataset
% top = max(max(b));
% bottom = min(min(b));

%%
% Figure 1 is a complete timeseries (starting at PJDay 500) for two probes 
% plus the mean of that species, spread out over 6 panels
run Granier_QAQC_Fig1;

% Figures 2-5 are the same format as Figure 1 but they show probes P1A-P3A,
% P3B-P5B, J1A-J3A, and J3B-J5B, respectively, as well as the mean for each
% appropriate species.
run Granier_QAQC_Fig2_5;

% Figure 6 is the whole timeseries for two probes. Once the figure comes up
% you can zoom in using the Figure toolbar tools. Click on the "zoom in"
% button and then right-click on the figure, go to Zoom Options, and select
% "Horizontal Zoom". This allows you to zoom in on the x-axis only, without
% the y-axis sliding all around. Similarly, once you are done with a view,
% click on the Hand button to pan to a different timeframe, right-click on
% the figure, and select "Horizontal Pan" from the Pan Options.

%%
% It might be helpful to have open the Excel file with the timestamps and 
% corresponding dates/times so you know what season, etc., you're looking at.
run Granier_QAQC_Fig6_DK1;

%%
% Plot dTmax for probe in question
run Granier_QAQC_Fig7;
% Plot the sum of points greater than dTmax for each day - ideally they
% would all be zero
run Granier_QAQC_Fig13;
% Plot points greater than dTmax. Note that this figure is pretty useless
% until  you zoom in quite a bit!
run Granier_QAQC_Fig14;

%%
% Calculate Js

% Correct dT's for <10mm sapwood. This correction is not totally functional yet
% because probes change places through time. Leave this block commented out
% until we solve this problem.
% n = G_clean(:,12:31);
% run Clearwater_corrections;
% G_clean(:,12:31)=n(:,:);
% clear m_11 m_12 m_15 m_16 n_11 n_12 n_15 n_16 n;

% calculate velocity, v
k = zeros(length(G_clean),20); v = k; 
k = (dTmax(G_clean(:,9), 12:31) - G_clean(:,12:31)) ./G_clean(:,12:31);
A = find(k<0);
B = isnan(k);
k(find(k<0))=0; %get rid of zeros and NaN's to avoid complex #'s in V
k(isnan(k))=0;
v = 0.0119 .*(k .^1.231)*10000;
v(A)=nan;
v(B)=nan;
v = cat(2, G_clean(:,1:11), v);
clear k;
% Calculate species mean Js
P_Js = nanmean(v(:,12:21),2);
J_Js = nanmean(v(:,22:31),2);

%%
run Granier_QAQC_Fig8_11;

%%
o = v(:,11+probe:12+probe); % pull out raw data for probe A + B
run Granier_QAQC_Fig12;

%%
% If you enter a timestamp below, and run the subroutine, the rest of the
% date/time info will show up in the command window. Same with Litvak  Day.
% timestamp = 5500;
% run when_is_Litvak_timestamp;
% lday = ;
% run when_is_Litvak_day;

% save output
% PJ_control_dTmax = dTmax;
% save('PJ_control_dTmax','PJ_control_dTmax');
% PJ_control_h_dTmax = hour_dTmax;
% save('PJ_control_h_dTmax','PJ_control_h_dTmax');

% ESTAS SON LAS DOS COLUMNAS EN LAS QUE SE
% ME QUEDARAN LOS DATOS DE jS QUE YO QUIERO 

% PJ_control_ts_dTmax = ts_dTmax;
% save('PJ_control_ts_dTmax','PJ_control_ts_dTmax');

PJ_control_Js = v;% de esta manera estas guardando unicamente los datos de flujo de savia.
%save('PJ_control_Js','PJ_control_Js');
dlmwrite( [qc_sap_path 'PJ_contrl_Js.csv'],PJ_control_Js, 'delimiter', ',', 'precision', '%.6f');
