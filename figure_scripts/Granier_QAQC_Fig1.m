% This script is run from Litvak_PJ_Control_Granier_QA_QC.m and generates a 
% figure of two 
% probes' complete timeseries, plus the species mean.  Data are mV, not Js.

figure(1); clf(1);
subplot(3,1,1); 
plot(x(1,time1:time2), a(time1:time2,1), '-r')
hold on
plot(x(1,time1:time2), b(time1:time2,1), '-c')
plot(x(1,time1:time2), a(time1:time2,2), '-g')
plot(x(1,time1:time2), b(time1:time2,2), '-b')
plot(x(1,time1:time2), c(time1:time2,1), '-k')
hold off
if sum(nansum(b(time1:time2, 1:2)))~=0
    top = max(max(b(time1:time2, 1:2)))+.05;
    bottom = min(min(b(time1:time2, 1:2)))-.05;
else
    top = max(max(c(time1:time2,1)))+.05;
    bottom = min(min(c(time1:time2,1)))-.05;
end
axis([time1-200 time2+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
title(sprintf('mV output raw and cleaned'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2+1:time3), a(time2+1:time3,1), '-r')
hold on
plot(x(1,time2+1:time3), b(time2+1:time3,1), '-c')
plot(x(1,time2+1:time3), a(time2+1:time3,2), '-g')
plot(x(1,time2+1:time3), b(time2+1:time3,2), '-b')
plot(x(1,time2+1:time3), c(time2+1:time3,1), '-k')
hold off
if sum(nansum(b(time2+1:time3, 1:2)))~=0
    top = max(max(b(time2+1:time3, 1:2)))+.05;
    bottom = min(min(b(time2+1:time3, 1:2)))-.05;
else
    top = max(max(c(time2+1:time3,1)))+.05;
    bottom = min(min(c(time2+1:time3,1)))-.05;
end
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');

subplot(3,1,3); 
plot(x(1,time3+1:end), a(time3+1:end,1), '-r')
hold on
plot(x(1,time3+1:end), b(time3+1:end,1), '-c')
plot(x(1,time3+1:end), a(time3+1:end,2), '-g')
plot(x(1,time3+1:end), b(time3+1:end,2), '-b')
plot(x(1,time3+1:end), c(time3+1:end,1), '-k')
hold off
if sum(nansum(b(time3+1:end, 1:2)))~=0
    top = max(max(b(time3+1:end, 1:2)))+.05;
    bottom = min(min(b(time3+1:end, 1:2)))-.05;
else
    top = max(max(c(time3+1:end,1)))+.05;
    bottom = min(min(c(time3+1:end,1)))-.05;
end
axis([time3-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
legend('probe A raw','probe A clean', 'probe B raw', 'probe B clean','species mean clean');
