% This script is run from Litvak_PJ_Control_Granier_QA_QC.m

figure(7); clf(7);
plot(e(1,:), f(:,1), '.-c')
hold on
plot(e(1,:), f(:,2), '.-b')
hold off
top = max(max(f(500:end,1:2)))+.05;
bottom = min(min(f(500:end,1:2)))-.05;
axis([min(G_raw(:,9)) max(dTmax(:,9))+20 bottom top]);
legend('probe A dTmax','probe B dTmax');
