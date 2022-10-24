% optional: clean up before running script
close all;
clear all;

% load data
s = MPB_load_data('example_DBR_final.dat');
a = 0.32; % um

% get edges of the fundamental bandgap (between band 1 and 2)
gap_edges_fn = [max(s.fn(:,1)), min(s.fn(:,2))];
gap_edges_lambda = a./ gap_edges_fn;

% create new figure
figure;

% plot against normalized frequency
subplot(1,2,1);
plot(s.k1, s.fn);
xlabel('k_x/(2\pi/a)');
ylabel('a/\lambda (no unit)');
% highlight edges and middle of the bandgap
yline(gap_edges_fn(1), 'k--'); % gap edge
yline(mean(gap_edges_fn), 'k--'); % gap middle
yline(gap_edges_fn(2), 'k--'); % gap edge

% plot against wavelength
subplot(1,2,2);
plot(s.k1, a ./ s.fn);
xlabel('k_x/(2\pi/a)');
ylabel('\lambda (\mum)');
ylim([gap_edges_lambda(1)-1, gap_edges_lambda(2)+1]);
% highlight edges and middle of the bandgap
yline(gap_edges_lambda(1), 'k--'); % gap edge
yline(mean(gap_edges_lambda), 'k--'); % gap middle
yline(gap_edges_lambda(2), 'k--'); % gap edge

% print out gap information
fprintf('The range of the fundamental bandgap is: %.3f um - %.3f um\n',...
  min(gap_edges_lambda), max(gap_edges_lambda));
fprintf('The midgap wavelength is: %.3f um\n',...
  mean(gap_edges_lambda));
fprintf('The gap-midgap ratio is: %.3f%%\n',...
  100*(max(gap_edges_fn)-min(gap_edges_fn))/mean(gap_edges_fn));

% save figure
saveas(gcf, 'example_DBR_final.svg');
