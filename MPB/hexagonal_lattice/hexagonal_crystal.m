% optional: clean up before running script
close all;
clear all;

% default options for the lines and text
set(groot, 'defaultLineLineWidth', 2.0);
set(groot, 'defaultAxesFontSize', 20);

% load data
te = MPB_load_data('hexagonal_crystal.te.dat');
a = 0.4; % um

% get edges of the fundamental bandgap (between band 1 and 2)
gap_edges_fn = [max(te.fn(:,1)), min(te.fn(:,2))];
gap_edges_lambda = a./ gap_edges_fn;

% print out gap information
fprintf('The range of the fundamental TE bandgap is: %.3f um - %.3f um\n',...
  min(gap_edges_lambda), max(gap_edges_lambda));

% create new figure
figure;

% plot against normalized frequency
subplot(1,2,1);
h_bands_fn = plot(te.kindex, te.fn, 'r-o', 'markersize', 5, 'DisplayName','TE bands');
xlabel('k-index');
ylabel('a/\lambda (no unit)');
hold on;
plot([te.kindex(1), te.kindex(end)], [gap_edges_fn(1), gap_edges_fn(1)], 'k--');
plot([te.kindex(1), te.kindex(end)], [mean(gap_edges_fn), mean(gap_edges_fn)], 'k--');
plot([te.kindex(1), te.kindex(end)], [gap_edges_fn(2), gap_edges_fn(2)], 'k--');
xticks(1:5:16);
xticklabels({'\Gamma','M','K','\Gamma'});
xline(1:5:16);

% plot against wavelength
subplot(1,2,2);
h_bands_lambda = plot(te.kindex, a ./ te.fn, 'r-o', 'markersize', 5, 'DisplayName','TE bands');
xlabel('k-index');
ylabel('\lambda (um)');
ylim([gap_edges_lambda(1)-1, gap_edges_lambda(2)+1]);
hold on;
plot([te.kindex(1), te.kindex(end)], [gap_edges_lambda(1), gap_edges_lambda(1)], 'k--');
plot([te.kindex(1), te.kindex(end)], [mean(gap_edges_lambda), mean(gap_edges_lambda)], 'k--');
plot([te.kindex(1), te.kindex(end)], [gap_edges_lambda(2), gap_edges_lambda(2)], 'k--');
xticks(1:5:16);
xticklabels({'\Gamma','M','K','\Gamma'});
xline(1:5:16);
