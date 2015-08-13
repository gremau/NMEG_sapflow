% This script is run from Granier_QAQC_P12 and generates four figures that
% include complete timeseries of all 10 Granier probes on a plot, plus the
% means for each species.  These data are in mV, not Js.

% *************************************************
figure(2); clf(2);
subplot(3,1,1); 
plot(x(1,time1:time2), G_clean(time1:time2,12), '-m')
hold on
plot(x(1,time1:time2), G_clean(time1:time2,13), '-y')
plot(x(1,time1:time2), G_clean(time1:time2,14), '-g')
plot(x(1,time1:time2), G_clean(time1:time2,15), '-b')
plot(x(1,time1:time2), G_clean(time1:time2,16), '-c')
plot(x(1,time1:time2), c(time1:time2,1), '-k')
hold off
top = max(max(G_clean(time1:time2,12:16)))+.05;
bottom = min(min(G_clean(time1:time2,12:16)))-.05;
xlabel('Litvak timestamp'); ylabel('mV');
axis([time1-200 time2+200 bottom top]);
title(sprintf('Cleaned mV output'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), G_clean(time2:time3,12), '-m')
hold on
plot(x(1,time2:time3), G_clean(time2:time3,13), '-y')
plot(x(1,time2:time3), G_clean(time2:time3,14), '-g')
plot(x(1,time2:time3), G_clean(time2:time3,15), '-b')
plot(x(1,time2:time3), G_clean(time2:time3,16), '-c')
plot(x(1,time2:time3), c(time2:time3,1), '-k')
hold off
top = max(max(G_clean(time2:time3,12:16)))+.05;
bottom = min(min(G_clean(time2:time3,12:16)))-.05;
xlabel('Litvak timestamp'); ylabel('mV');
axis([time2-200 time3+200 bottom top]);

subplot(3,1,3);
plot(x(1,time3:end), G_clean(time3:end,12), '-m')
hold on
plot(x(1,time3:end), G_clean(time3:end,13), '-y')
plot(x(1,time3:end), G_clean(time3:end,14), '-g')
plot(x(1,time3:end), G_clean(time3:end,15), '-b')
plot(x(1,time3:end), G_clean(time3:end,16), '-c')
plot(x(1,time3:end), c(time3:end,1), '-k')
hold off
top = max(max(G_clean(time3:end,12:16)))+.05;
bottom = min(min(G_clean(time3:end,12:16)))-.05;
axis([time3-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
legend('P1A','P1B', 'P2A', 'P2B','P3A','pinon mean');

% ***********************************************************
figure(3); clf(3);
subplot(3,1,1); 
plot(x(1,time1:time2), G_clean(time1:time2,17), '-m')
hold on
plot(x(1,time1:time2), G_clean(time1:time2,18), '-y')
plot(x(1,time1:time2), G_clean(time1:time2,19), '-g')
plot(x(1,time1:time2), G_clean(time1:time2,20), '-b')
plot(x(1,time1:time2), G_clean(time1:time2,21), '-c')
plot(x(1,time1:time2), c(time1:time2,1), '-k')
hold off
top = max(max(G_clean(time1:time2,17:21)))+.05;
bottom = min(min(G_clean(time1:time2,17:21)))-.05;
xlabel('Litvak timestamp'); ylabel('mV');
axis([time1-200 time2+200 bottom top]);
title(sprintf('Cleaned mV output'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), G_clean(time2:time3,17), '-m')
hold on
plot(x(1,time2:time3), G_clean(time2:time3,18), '-y')
plot(x(1,time2:time3), G_clean(time2:time3,19), '-g')
plot(x(1,time2:time3), G_clean(time2:time3,20), '-b')
plot(x(1,time2:time3), G_clean(time2:time3,21), '-c')
plot(x(1,time2:time3), c(time2:time3,1), '-k')
hold off
top = max(max(G_clean(time2:time3,17:21)))+.05;
bottom = min(min(G_clean(time2:time3,17:21)))-.05;
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');

subplot(3,1,3); 
plot(x(1,time3:end), G_clean(time3:end,17), '-m')
hold on
plot(x(1,time3:end), G_clean(time3:end,18), '-y')
plot(x(1,time3:end), G_clean(time3:end,19), '-g')
plot(x(1,time3:end), G_clean(time3:end,20), '-b')
plot(x(1,time3:end), G_clean(time3:end,21), '-c')
plot(x(1,time3:end), c(time3:end,1), '-k')
hold off
top = max(max(G_clean(time3:end,17:21)))+.05;
bottom = min(min(G_clean(time3:end,17:21)))-.05;
axis([time3-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
legend('P3B', 'P4A', 'P4B','P5A','P5B','pinon mean');

% ******************************************************
figure(4); clf(4); % JUMO T6A - T8A
subplot(3,1,1); 
plot(x(1,time1:time2), G_clean(time1:time2,22), '-m')
hold on
plot(x(1,time1:time2), G_clean(time1:time2,23), '-y')
plot(x(1,time1:time2), G_clean(time1:time2,24), '-g')
plot(x(1,time1:time2), G_clean(time1:time2,25), '-b')
plot(x(1,time1:time2), G_clean(time1:time2,26), '-c')
plot(x(1,time1:time2), d(time1:time2,1), '-k')
hold off
top = max(max(G_clean(time1:time2,22:26)))+.05;
bottom = min(min(G_clean(time1:time2,22:26)))-.05;
axis([time1-200 time2+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
title(sprintf('Cleaned mV output'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), G_clean(time2:time3,22), '-m')
hold on
plot(x(1,time2:time3), G_clean(time2:time3,23), '-y')
plot(x(1,time2:time3), G_clean(time2:time3,24), '-g')
plot(x(1,time2:time3), G_clean(time2:time3,25), '-b')
plot(x(1,time2:time3), G_clean(time2:time3,26), '-c')
plot(x(1,time2:time3), d(time2:time3,1), '-k')
hold off
top = max(max(G_clean(time2:time3,22:26)))+.05;
bottom = min(min(G_clean(time2:time3,22:26)))-.05;
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');

subplot(3,1,3); 
plot(x(1,time3:end), G_clean(time3:end,22), '-m')
hold on
plot(x(1,time3:end), G_clean(time3:end,23), '-y')
plot(x(1,time3:end), G_clean(time3:end,24), '-g')
plot(x(1,time3:end), G_clean(time3:end,25), '-b')
plot(x(1,time3:end), G_clean(time3:end,26), '-c')
plot(x(1,time3:end), d(time3:end,1), '-k')
hold off
top = max(max(G_clean(time3:end,22:26)))+.05;
bottom = min(min(G_clean(time3:end,22:26)))-.05;
axis([time3-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
legend('J1A','J1B', 'J2A', 'J2B','J3A','juniper mean');

% **************************************************************
figure(5); clf(5);
subplot(3,1,1); 
plot(x(1,time1:time2), G_clean(time1:time2,27), '-m')
hold on
plot(x(1,time1:time2), G_clean(time1:time2,28), '-y')
plot(x(1,time1:time2), G_clean(time1:time2,29), '-g')
plot(x(1,time1:time2), G_clean(time1:time2,30), '-b')
plot(x(1,time1:time2), G_clean(time1:time2,31), '-c')
plot(x(1,time1:time2), d(time1:time2,1), '-k')
hold off
top = max(max(G_clean(time1:time2,27:31)))+.05;
bottom = min(min(G_clean(time1:time2,27:31)))-.05;
axis([time1-200 time2+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
title(sprintf('Cleaned mV output'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), G_clean(time2:time3,27), '-m')
hold on
plot(x(1,time2:time3), G_clean(time2:time3,28), '-y')
plot(x(1,time2:time3), G_clean(time2:time3,29), '-g')
plot(x(1,time2:time3), G_clean(time2:time3,30), '-b')
plot(x(1,time2:time3), G_clean(time2:time3,31), '-c')
plot(x(1,time2:time3), d(time2:time3,1), '-k')
hold off
top = max(max(G_clean(time2:time3,27:31)))+.05;
bottom = min(min(G_clean(time2:time3,27:31)))-.05;
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');

subplot(3,1,3); 
plot(x(1,time3:end), G_clean(time3:end,27), '-m')
hold on
plot(x(1,time3:end), G_clean(time3:end,28), '-y')
plot(x(1,time3:end), G_clean(time3:end,29), '-g')
plot(x(1,time3:end), G_clean(time3:end,30), '-b')
plot(x(1,time3:end), G_clean(time3:end,31), '-c')
plot(x(1,time3:end), d(time3:end,1), '-k')
hold off
top = max(max(G_clean(time3:end,27:31)))+.05;
bottom = min(min(G_clean(time3:end,27:31)))-.05;
axis([time3-200 max(G_clean(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('mV');
legend('J3B', 'J4A', 'J4B','J5A','J5B','juniper mean');
