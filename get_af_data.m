function T = get_af_data( site, path, start_yr, stop_yr )
% Make sure we dont try to load anything before 2009 for girdled site
if site=='Mpg'
    start_yr = 2009;
end

% Concatenate a bunch of 30 minute Ameriflux files into one table
raw=[];
af_years = start_yr:stop_yr;
% For each year add data to raw
for i = 1:length(af_years)
    af_fname = ['US-', site '_' num2str(af_years(i)) '_gapfilled.txt'];
    data = dlmread( [path af_fname], ',', 5, 0 );
    data( data==-9999 ) = NaN; % Convert -9999 to NaN
    raw = [raw ; data];
end
% Add an empty year of data for 2008 at Mpg
if site=='Mpg'
    empty = nan * data;
    raw = [empty ; raw ];
end

% Get column headers from the last file
fid = fopen( [path af_fname ]);
for i = 1:3
    discard = fgetl( fid ); % Discard first 3 lines of file
end
var_names = fgetl( fid ); % Column headers are here
var_names = regexp( var_names, ',', 'split' ); % Parse them
fclose( fid );

% Create a table
T = array2table( raw, 'VariableNames', var_names );
end