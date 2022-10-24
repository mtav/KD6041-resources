% optional: clean up before running script
close all;
clear all;

% load the TMM data
load('TMM_data.mat');
% load the MPB data
MPB_data = MPB_load_data('example_DBR_final.dat');

% get the gap infos
gap_infos = MPB_getGaps(MPB_data);

% set the Y axis range
y_limits = [0,0.7];

% create the figure
figure;

% plot the TMM data
subplot(1,2,1); hold on;
title('TMM');
plot(R, a./wvl_list);
ylabel('a/\lambda (no unit)');
xlabel('Reflectance R (no unit)');
ylim(y_limits);
% highlight edges of the bandgap
yline(gap_infos.fullgaps.bottom, 'r--');
yline(gap_infos.fullgaps.top, 'b--');

% plot the MPB data
subplot(1,2,2); hold on;
title('PWE');
plot(MPB_data.k1, MPB_data.fn(:,1), 'r-');
plot(MPB_data.k1, MPB_data.fn(:,2), 'g-');
plot(MPB_data.k1, MPB_data.fn(:,3), 'b-');
xlabel('k_x/(2\pi/a)');
ylabel('a/\lambda (no unit)');
ylim(y_limits);
% highlight edges of the bandgap
yline(gap_infos.fullgaps.bottom, 'r--');
yline(gap_infos.fullgaps.top, 'b--');

% save the figure
saveas(gcf, 'DBR_TMM_vs_PWE.svg');
