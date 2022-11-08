% optional: clean up before running script
close all;
clear all;

% Defining some default options to label the vertical lines:
set(groot,'defaultConstantLineLabelOrientation', 'horizontal');
set(groot,'defaultConstantLineLabelVerticalAlignment', 'bottom');
set(groot,'defaultConstantLineLabelHorizontalAlignment', 'center');

% load data
s = MPB_load_data('square_lattice.dat');
a = 1.23; % um

% get edges of the fundamental bandgap (between band 1 and 2)
gap_edges_fn = [max(s.fn(:,1)), min(s.fn(:,2))];
gap_edges_lambda = a./ gap_edges_fn;

% create new figure
figure;

% plot against normalized frequency
subplot(1,2,1);
plot(s.kindex, s.fn, 'b-');
xlabel('k_{index}');
ylabel('a/\lambda (no unit)');
xlim([s.kindex(1), s.kindex(end)]);
ylim([0, 0.8]);
% highlight edges and middle of the bandgap
yline(gap_edges_fn(1), 'k--'); % gap edge
yline(mean(gap_edges_fn), 'k--'); % gap middle
yline(gap_edges_fn(2), 'k--'); % gap edge
% indicate high-symmetry points
xline(1, 'k-', '\Gamma');
xline(6, 'k-', 'X');
xline(11, 'k-', 'M');
xline(16, 'k-', '\Gamma');

% plot against wavelength
subplot(1,2,2);
plot(s.kindex, a ./ s.fn, 'b-');
xlabel('k_{index}');
ylabel('\lambda (\mum)');
xlim([s.kindex(1), s.kindex(end)]);
ylim([min(gap_edges_lambda(:))-1, max(gap_edges_lambda(:))+1]);
% highlight edges and middle of the bandgap
yline(gap_edges_lambda(1), 'k--'); % gap edge
yline(mean(gap_edges_lambda), 'k--'); % gap middle
yline(gap_edges_lambda(2), 'k--'); % gap edge
% indicate high-symmetry points
xline(1, 'k-', '\Gamma');
xline(6, 'k-', 'X');
xline(11, 'k-', 'M');
xline(16, 'k-', '\Gamma');

% print out gap information
fprintf('The range of the fundamental bandgap is: %.3f um - %.3f um\n',...
  min(gap_edges_lambda), max(gap_edges_lambda));
fprintf('The midgap wavelength is: %.3f um\n',...
  mean(gap_edges_lambda));
fprintf('The gap-midgap ratio is: %.3f%%\n',...
  100*(max(gap_edges_fn)-min(gap_edges_fn))/mean(gap_edges_fn));

% save figure
saveas(gcf, 'square_lattice.svg');
