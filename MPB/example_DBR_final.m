close all;
clear all;
s = MPB_load_data('example_DBR_final.dat');
a = 0.32; % um

gap_edges_fn = [max(s.fn(:,1)), min(s.fn(:,2))];
gap_edges_lambda = a./ gap_edges_fn;

figure;
subplot(1,2,1);
plot(s.k1, s.fn);
xlabel('kx/(2\pi/a)');
ylabel('a/\lambda');
hold on;
plot([s.k1(1), s.k1(end)], [gap_edges_fn(1), gap_edges_fn(1)], 'k--');
plot([s.k1(1), s.k1(end)], [mean(gap_edges_fn), mean(gap_edges_fn)], 'k--');
plot([s.k1(1), s.k1(end)], [gap_edges_fn(2), gap_edges_fn(2)], 'k--');

subplot(1,2,2);
plot(s.k1, a ./ s.fn);
xlabel('kx/(2\pi/a)');
ylabel('\lambda (um)');
ylim([gap_edges_lambda(1)-1, gap_edges_lambda(2)+1]);
hold on;
plot([s.k1(1), s.k1(end)], [gap_edges_lambda(1), gap_edges_lambda(1)], 'k--');
plot([s.k1(1), s.k1(end)], [mean(gap_edges_lambda), mean(gap_edges_lambda)], 'k--');
plot([s.k1(1), s.k1(end)], [gap_edges_lambda(2), gap_edges_lambda(2)], 'k--');

fprintf('The range of the fundamental bandgap is: %.3f um - %.3f um\n',...
  min(gap_edges_lambda), max(gap_edges_lambda));

saveas(gcf, 'example_DBR_final.svg');
