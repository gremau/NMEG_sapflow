% This script is run from Litvak_PJ_Control_Granier_QA_QC.m.

%vspace = 0.01;
figure(6); clf(6);
ax1 = subplot(6,1,[1,2]); plot(x(1,time1:max(x)), c(time1:max(x),1), '-k')
set(gca, 'XTickLabel', [])
hold on
plot(x(1,time1:max(x)), a(time1:max(x),1), '.-r')
plot(x(1,time1:max(x)), b(time1:max(x),1), '.-c')
plot(x(1,time1:max(x)), a(time1:max(x),2), '.-g')
plot(x(1,time1:max(x)), b(time1:max(x),2), '.-b')
hold off
top = max(max(b(time1:end,1:2)))+.05;
bottom = min(min(b(time1:end,1:2)))-.05;
axis([time1-200 max(G_clean(:,11))+200 bottom top]);

ax2 = subplot(6,1,3); plot(x(1,time1:max(x)), Precip(time1:max(x)))
set(gca, 'XTickLabel', [])

ax3 = subplot(6,1,4); plot(x(1,time1:max(x)), AirTC(time1:max(x)))
set(gca, 'XTickLabel', [])

ax4 = subplot(6,1,5); plot(x(1,time1:max(x)), VPD(time1:max(x)))
set(gca, 'XTickLabel', [])

ax5 = subplot(6,1,6); plot(x(1,time1:max(x)), ShortWave(time1:max(x)))
ylim([-100, 1500]);

xlabel('Litvak timestamp'); ylabel('mV');
ylabel(ax1, 'mV','FontSize',12);
ylabel(ax2, 'Precip','FontSize',12);
ylabel(ax3, 'TA','FontSize',12);
ylabel(ax4, 'VPD','FontSize',12);
ylabel(ax5, 'RG','FontSize',12);

legend(ax1, 'species mean clean','probe A raw','probe A clean', 'probe B raw', 'probe B clean');
linkaxes([ax1, ax2, ax3, ax4, ax5], 'x')
