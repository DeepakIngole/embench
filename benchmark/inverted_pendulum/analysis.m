
time_vector = linspace(0, num_sim_iters*Ts, num_sim_iters+1);

solvers = fieldnames(X);

figure(1); clf;
for i=1:4
    subplot(4, 2, i); hold on;
    for j=1:numel(solvers)
        plot(time_vector, X.(solvers{j})(:, i))
    end
end

subplot(4, 2, 5); hold on;
for j=1:numel(solvers)
    stairs(time_vector(1:end-1), U.(solvers{j}))
end

subplot(4, 2, 6); hold on;
for j=1:numel(solvers)
    stairs(time_vector(1:end-1), status.(solvers{j}))
end

subplot(4, 2, 7);
for j=1:numel(solvers)
   semilogy(timing.(solvers{j}));
   hold on;
end
legend(solvers);

subplot(4, 2, 8); hold on;
for j=1:numel(solvers)
   stairs(num_iters.(solvers{j}));
end

fprintf([repmat('-', 1, 80), '\n']);
fprintf(['(ms)\t\tmean\t\t\tmin\t\t\tmax\t\t', '\n']);
fprintf([repmat('-', 1, 80), '\n']);
for j=1:numel(solvers)
   fprintf(['%s\t\t', '%.2f', '\t\t\t', '%.2f', '\t\t\t', '%.2f', '\t\t\n'], ...
       solvers{j}, 1000*mean(timing.(solvers{j})), ...
       1000*min(timing.(solvers{j})), 1000*max(timing.(solvers{j})));
end
