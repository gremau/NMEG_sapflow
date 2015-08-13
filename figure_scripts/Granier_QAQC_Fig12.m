% This script is run from Litvak_PJ_Control_Granier_QA_QC.m.

figure(12); clf(12);
plot(x(1,time1:max(x)), o(time1:max(x),1), '.-c')
hold on
plot(x(1,time1:max(x)), o(time1:max(x),2), '.-b')
hold off
top = max(max(o(time1:end,1:2)))+10;
bottom = min(min(o(time1:end,1:2)))-10;
axis([time1-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
title(sprintf('Js'),'FontSize',12);

legend('probe A Js','probe B Js');
