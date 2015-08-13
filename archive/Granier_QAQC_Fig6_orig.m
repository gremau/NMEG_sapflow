% This script is run from Litvak_PJ_Control_Granier_QA_QC.m.

figure(6); clf(6);
plot(x(1,time1:max(x)), c(time1:max(x),1), '-k')
hold on
plot(x(1,time1:max(x)), a(time1:max(x),1), '.-r')
plot(x(1,time1:max(x)), b(time1:max(x),1), '.-c')
plot(x(1,time1:max(x)), a(time1:max(x),2), '.-g')
plot(x(1,time1:max(x)), b(time1:max(x),2), '.-b')
hold off
top = max(max(b(time1:end,1:2)))+.05;
bottom = min(min(b(time1:end,1:2)))-.05;
axis([time1-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
title(sprintf('mV output'),'FontSize',12);

legend('species mean clean','probe A raw','probe A clean', 'probe B raw', 'probe B clean');
