% Defining some default options to label the vertical lines:
set(groot,'defaultConstantLineLabelOrientation', 'horizontal');
set(groot,'defaultConstantLineLabelVerticalAlignment', 'bottom');
set(groot,'defaultConstantLineLabelHorizontalAlignment', 'center');

% load data
s = MPB_load_data('square_lattice.dat');

% get edges of the fundamental bandgap (between band 1 and 2)
gap_edges_fn = [max(s.fn(:,1)), min(s.fn(:,2))];

% plot against normalized frequency
figure; % create new figure
plot(s.kindex, s.fn, 'b-');
xlabel('k_{index}');
ylabel('a/\lambda (no unit)');
xlim([s.kindex(1), s.kindex(end)]);
% highlight edges and middle of the bandgap
yline(gap_edges_fn(1), 'k--'); % gap edge
yline(mean(gap_edges_fn), 'k--'); % gap middle
yline(gap_edges_fn(2), 'k--'); % gap edge
% indicate high-symmetry points
xline(1, 'k-', '\Gamma');
xline(6, 'k-', 'X');
xline(11, 'k-', 'M');
xline(16, 'k-', '\Gamma');
