% This script takes a PJ timestamp and outputs the rest of the date
% information

% timestamp = 47910;
load Litvak_timestamp_complete;
lts_index(find(lts_index(:,11)==timestamp),1:10)