% This script is run from Litvak_PJ_Control_Granier_QA_QC.m
% and generates four figures that
% include complete timeseries of all 10 Granier probes on a plot, plus the
% means for each species.  These data are Js.

% *************************************************
figure(8); clf(8);
subplot(3,1,1); 
plot(x(1,time1:time2), v(time1:time2,12), '-m')
hold on
plot(x(1,time1:time2), v(time1:time2,13), '-y')
plot(x(1,time1:time2), v(time1:time2,14), '-g')
plot(x(1,time1:time2), v(time1:time2,15), '-b')
plot(x(1,time1:time2), v(time1:time2,16), '-c')
plot(x(1,time1:time2), P_Js(time1:time2,1), '-k')
hold off
top = max(max(v(time1:time2,12:16)))+.05;
bottom = min(min(v(time1:time2,12:16)))-.05;
axis([time1-200 time2+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
title(sprintf('cleaned Js'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), v(time2:time3,12), '-m')
hold on
plot(x(1,time2:time3), v(time2:time3,13), '-y')
plot(x(1,time2:time3), v(time2:time3,14), '-g')
plot(x(1,time2:time3), v(time2:time3,15), '-b')
plot(x(1,time2:time3), v(time2:time3,16), '-c')
plot(x(1,time2:time3), P_Js(time2:time3,1), '-k')
hold off
top = max(max(v(time2:time3,12:16)))+.05;
bottom = min(min(v(time2:time3,12:16)))-.05;
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');

subplot(3,1,3); 
plot(x(1,time3:end), v(time3:end,12), '-m')
hold on
plot(x(1,time3:end), v(time3:end,13), '-y')
plot(x(1,time3:end), v(time3:end,14), '-g')
plot(x(1,time3:end), v(time3:end,15), '-b')
plot(x(1,time3:end), v(time3:end,16), '-c')
plot(x(1,time3:end), P_Js(time3:end,1), '-k')
hold off
top = max(max(v(time3:end,12:16)))+.05;
bottom = min(min(v(time3:end,12:16)))-.05;
axis([time3-200 max(v(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
legend('P1A','P1B', 'P2A', 'P2B','P3A','pinon mean');

% ***********************************************************
figure(9); clf(9);
subplot(3,1,1); 
plot(x(1,time1:time2), v(time1:time2,17), '-m')
hold on
plot(x(1,time1:time2), v(time1:time2,18), '-y')
plot(x(1,time1:time2), v(time1:time2,19), '-g')
plot(x(1,time1:time2), v(time1:time2,20), '-b')
plot(x(1,time1:time2), v(time1:time2,21), '-c')
plot(x(1,time1:time2), P_Js(time1:time2,1), '-k')
hold off
top = max(max(v(time1:time2,17:21)))+.05;
bottom = min(min(v(time1:time2,17:21)))-.05;
axis([time1-200 time2+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
title(sprintf('cleaned Js'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), v(time2:time3,17), '-m')
hold on
plot(x(1,time2:time3), v(time2:time3,18), '-y')
plot(x(1,time2:time3), v(time2:time3,19), '-g')
plot(x(1,time2:time3), v(time2:time3,20), '-b')
plot(x(1,time2:time3), v(time2:time3,21), '-c')
plot(x(1,time2:time3), P_Js(time2:time3,1), '-k')
hold off
top = max(max(v(time2:time3,17:21)))+.05;
bottom = min(min(v(time2:time3,17:21)))-.05;
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');

subplot(3,1,3); 
plot(x(1,time3:end), v(time3:end,17), '-m')
hold on
plot(x(1,time3:end), v(time3:end,18), '-y')
plot(x(1,time3:end), v(time3:end,19), '-g')
plot(x(1,time3:end), v(time3:end,20), '-b')
plot(x(1,time3:end), v(time3:end,21), '-c')
plot(x(1,time3:end), P_Js(time3:end,1), '-k')
hold off
top = max(max(v(time3:end,17:21)))+.05;
bottom = min(min(v(time3:end,17:21)))-.05;
axis([time3-200 max(v(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
legend('P3B', 'P4A', 'P4B','P5A','P5B','pinon mean');

% ******************************************************
figure(10); clf(10); % JUMO 
subplot(3,1,1); 
plot(x(1,time1:time2), v(time1:time2,22), '-m')
hold on
plot(x(1,time1:time2), v(time1:time2,23), '-y')
plot(x(1,time1:time2), v(time1:time2,24), '-g')
plot(x(1,time1:time2), v(time1:time2,25), '-b')
plot(x(1,time1:time2), v(time1:time2,26), '-c')
plot(x(1,time1:time2), J_Js(time1:time2,1), '-k')
hold off
top = max(max(v(time1:time2,22:26)))+.05;
bottom = min(min(v(time1:time2,22:26)))-.05;
axis([time1-200 time2+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
title(sprintf('cleaned Js'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), v(time2:time3,22), '-m')
hold on
plot(x(1,time2:time3), v(time2:time3,23), '-y')
plot(x(1,time2:time3), v(time2:time3,24), '-g')
plot(x(1,time2:time3), v(time2:time3,25), '-b')
plot(x(1,time2:time3), v(time2:time3,26), '-c')
plot(x(1,time2:time3), J_Js(time2:time3,1), '-k')
hold off
top = max(max(v(time2:time3,22:26)))+.05;
bottom = min(min(v(time2:time3,22:26)))-.05;
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');

subplot(3,1,3); 
plot(x(1,time3:end), v(time3:end,22), '-m')
hold on
plot(x(1,time3:end), v(time3:end,23), '-y')
plot(x(1,time3:end), v(time3:end,24), '-g')
plot(x(1,time3:end), v(time3:end,25), '-b')
plot(x(1,time3:end), v(time3:end,26), '-c')
plot(x(1,time3:end), J_Js(time3:end,1), '-k')
hold off
top = max(max(v(time3:end,22:26)))+.05;
bottom = min(min(v(time3:end,22:26)))-.05;
axis([time3-200 max(v(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
legend('J1A','J1B', 'J2A', 'J2B','J3A','juniper mean');

% **************************************************************
figure(11); clf(11);
subplot(3,1,1); 
plot(x(1,time1:time2), v(time1:time2,27), '-m')
hold on
plot(x(1,time1:time2), v(time1:time2,28), '-y')
plot(x(1,time1:time2), v(time1:time2,29), '-g')
plot(x(1,time1:time2), v(time1:time2,30), '-b')
plot(x(1,time1:time2), v(time1:time2,31), '-c')
plot(x(1,time1:time2), J_Js(time1:time2,1), '-k')
hold off
top = max(max(v(time1:time2,27:31)))+.05;
bottom = min(min(v(time1:time2,27:31)))-.05;
axis([time1-200 time2+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
title(sprintf('cleaned Js'),'FontSize',12);

subplot(3,1,2); 
plot(x(1,time2:time3), v(time2:time3,27), '-m')
hold on
plot(x(1,time2:time3), v(time2:time3,28), '-y')
plot(x(1,time2:time3), v(time2:time3,29), '-g')
plot(x(1,time2:time3), v(time2:time3,30), '-b')
plot(x(1,time2:time3), v(time2:time3,31), '-c')
plot(x(1,time2:time3), J_Js(time2:time3,1), '-k')
hold off
top = max(max(v(time2:time3,27:31)))+.05;
bottom = min(min(v(time2:time3,27:31)))-.05;
axis([time2-200 time3+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');

subplot(3,1,3); 
plot(x(1,time3:end), v(time3:end,27), '-m')
hold on
plot(x(1,time3:end), v(time3:end,28), '-y')
plot(x(1,time3:end), v(time3:end,29), '-g')
plot(x(1,time3:end), v(time3:end,30), '-b')
plot(x(1,time3:end), v(time3:end,31), '-c')
plot(x(1,time3:end), J_Js(time3:end,1), '-k')
hold off
top = max(max(v(time3:end,27:31)))+.05;
bottom = min(min(v(time3:end,27:31)))-.05;
axis([time3-200 max(v(:,11))+200 bottom top]);
xlabel('Litvak timestamp'); ylabel('Js, g m-2 s-1');
legend('J3B', 'J4A', 'J4B','J5A','J5B','juniper mean');
