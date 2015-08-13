% This script is run from Litvak_PJ_Control_Granier_QA_QC.m.

figure(14); clf(14);
plot(x(1,time1:max(x)), h(time1:max(x),1), '.-c')
hold on
plot(x(1,time1:max(x)), h(time1:max(x),2), '.-b')
hold off
top = max(max(h(time1:end,1:2)))+.05;
bottom = min(min(h(time1:end,1:2)))-.05;
axis([time1-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
title(sprintf('"2" means mV > dTmax, "1" means mV = dTmax, "0" means mV < dTmax'),'FontSize',12);

legend('probe A','probe B');
