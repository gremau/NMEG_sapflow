% This script is run from Litvak_PJ_Control_Granier_QA_QC.m.

figure(13); clf(13);
plot(e(1,:), g(:,1), '.-c')
hold on
plot(e(1,:), g(:,2), '.-b')
hold off
top = 50;
bottom = -.05;
axis([450 max(dTmax(:,9))+20 bottom top]);
title(sprintf('Data points per day that are greater than dTmax'),'FontSize',12);
legend('probe A','probe B');
