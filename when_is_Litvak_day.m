% This script takes a PJ timestamp and outputs the rest of the date
% information

% lday = 479;
load Litvak_timestamp_complete;
lts_index(min(find(lts_index(:,9)==lday)),1:10)