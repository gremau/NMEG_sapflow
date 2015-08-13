% This program generates index and timestamp columns for the Litvak tower sites:
% 1 - Year
% 2 - Month
% 3 - Day
% 4 - Hour
% 5 - Minute
% 6 - Hour/min (i.e. 1330)
% 7 - Julian day
% 8 - decimal julian day
% 9 - Litvak Day
% 10 - decimal Litvak Day
% 11 - Litvak timestamp

% We have: Year, Julian Day, and HrMin
% Dataloggers are always on 30-min interval so there are 48 timestamps per
% day.

y = ts_cols(:,1);
jd = ts_cols(:,2);
hmin = ts_cols(:,3);
hmin(find(hmin(:,1)==2400),1)=0; % replace 2400 hour with 0 
jd(find(hmin(:,1)==0),1)=jd(find(hmin(:,1)==0),1)+1;
%Linea 22:encuentra el dia en el que la hora es 0000 y en ese caso a los dias en los que pase eso sumale uno


% leap years are 2008, 2012, 2016
% generate month
m = NaN(length(ts_cols),1);
for i = 1:length(m)
    if ~ismember(y(i,1), [2008 2012 2016]) % case for non-leap years
        if jd(i,1)<=31
            m(i,1)=1;
        elseif jd(i,1)>31 & jd(i,1)<=59
            m(i,1)=2;
        elseif jd(i,1)>59 & jd(i,1)<=90
            m(i,1)=3;
        elseif jd(i,1)>90 & jd(i,1)<=120
            m(i,1)=4;
        elseif jd(i,1)>120 & jd(i,1)<=151
            m(i,1)=5;
        elseif jd(i,1)>151 & jd(i,1)<=181
            m(i,1)=6;
        elseif jd(i,1)>181 & jd(i,1)<=212
            m(i,1)=7;
        elseif jd(i,1)>212 & jd(i,1)<=243
            m(i,1)=8;
        elseif jd(i,1)>243 & jd(i,1)<=273
            m(i,1)=9;
        elseif jd(i,1)>273 & jd(i,1)<=304
            m(i,1)=10;
        elseif jd(i,1)>304 & jd(i,1)<=334
            m(i,1)=11;
        elseif jd(i,1)>334 & jd(i,1)<=365
            m(i,1)=12;
        end;
    elseif ismember(y(i,1), [2008 2012 2016]) % case for leap years
        if jd(i,1)<=31
            m(i,1)=1;
        elseif jd(i,1)>31 & jd(i,1)<=60
            m(i,1)=2;
        elseif jd(i,1)>60 & jd(i,1)<=91
            m(i,1)=3;
        elseif jd(i,1)>91 & jd(i,1)<=121
            m(i,1)=4;
        elseif jd(i,1)>121 & jd(i,1)<=152
            m(i,1)=5;
        elseif jd(i,1)>152 & jd(i,1)<=182
            m(i,1)=6;
        elseif jd(i,1)>182 & jd(i,1)<=213
            m(i,1)=7;
        elseif jd(i,1)>213 & jd(i,1)<=244
            m(i,1)=8;
        elseif jd(i,1)>244 & jd(i,1)<=274
            m(i,1)=9;
        elseif jd(i,1)>274 & jd(i,1)<=305
            m(i,1)=10;
        elseif jd(i,1)>305 & jd(i,1)<=335
            m(i,1)=11;
        elseif jd(i,1)>335 & jd(i,1)<=366
            m(i,1)=12;
        end;
    end;
end;

% generate day
d = NaN(length(ts_cols),1);
for i = 1:length(ts_cols)
    if ~ismember(y(i,1), [2008 2012 2016]) % case for non-leap years
        if m(i,1)==1
            d(i,1)=jd(i,1);
        elseif (m(i,1)==2)
            d(i,1)=jd(i,1)-31;
        elseif (m(i,1)==3)
            d(i,1)=jd(i,1)-59;
        elseif (m(i,1)==4)
            d(i,1)=jd(i,1)-90;
        elseif (m(i,1)==5)
            d(i,1)=jd(i,1)-120;
        elseif (m(i,1)==6)
            d(i,1)=jd(i,1)-151;
        elseif (m(i,1)==7)
            d(i,1)=jd(i,1)-181;
        elseif (m(i,1)==8)
            d(i,1)=jd(i,1)-212;
        elseif (m(i,1)==9)
            d(i,1)=jd(i,1)-243;
        elseif (m(i,1)==10)
            d(i,1)=jd(i,1)-273;
        elseif (m(i,1)==11)
            d(i,1)=jd(i,1)-304;
        elseif (m(i,1)==12)
            d(i,1)=jd(i,1)-334;
        end;
    elseif ismember(y(i,1), [2008 2012 2016]) % case for leap years
        if (m(i,1)==1)
            d(i,1)=jd(i,1);
        elseif (m(i,1)==2)
            d(i,1)=jd(i,1)-31;
        elseif (m(i,1)==3)
            d(i,1)=jd(i,1)-60;
        elseif (m(i,1)==4)
            d(i,1)=jd(i,1)-91;
        elseif (m(i,1)==5)
            d(i,1)=jd(i,1)-121;
        elseif (m(i,1)==6)
            d(i,1)=jd(i,1)-152;
        elseif (m(i,1)==7)
            d(i,1)=jd(i,1)-182;
        elseif (m(i,1)==8)
            d(i,1)=jd(i,1)-213;
        elseif (m(i,1)==9)
            d(i,1)=jd(i,1)-244;
        elseif (m(i,1)==10)
            d(i,1)=jd(i,1)-274;
        elseif (m(i,1)==11)
            d(i,1)=jd(i,1)-305;
        elseif (m(i,1)==12)
            d(i,1)=jd(i,1)-335;
        end;
    end;
end;

% generate hour
h = floor((hmin/2400)/(1/24));

% generate minute
mi = (hmin(:,1)/2400)/(1/24)-floor((hmin(:,1)/2400)/(1/24));
mi(find(mi(:,1)<0.1),1)=0;
mi(find(mi(:,1)>0.1),1)=30;

% generate decimal Julian Day
djd = jd(:,1)+(hmin(:,1)/2400);

% generate Litvak Day
ld = NaN(length(ts_cols),1);
for i = 1:length(ts_cols)
    if y(i,1)==2008
        ld(i,1)=jd(i,1);
    elseif y(i,1)==2009
        ld(i,1)=jd(i,1)+366; % 2008 is a leap year
    elseif y(i,1)==2010
        ld(i,1)=jd(i,1)+731; 
    elseif y(i,1)==2011
        ld(i,1)=jd(i,1)+1096;
    elseif y(i,1)==2012
        ld(i,1)=jd(i,1)+1461;
    elseif y(i,1)==2013
        ld(i,1)=jd(i,1)+1827; % 2012 is a leap year
    elseif y(i,1)==2014
        ld(i,1)=jd(i,1)+2192; 
    elseif y(i,1)==2015
        ld(i,1)=jd(i,1)+2557;
    end;
end;

% generate decimal Litvak Day
dld = ld(:,1)+(hmin(:,1)/2400);

% generate timestamp
ts = (ld*48-48)+(h*2+mi/30+1);

% concatenate columns to make Litvak timestamp
lts = [y m d h mi hmin jd djd ld dld ts];

clear y m d h mi hmin jd djd ld dld ts;

