#! /bin/octave -qf

wave = dlmread('../test_results/signal.txt');
psd = dlmread('../test_results/psd.txt');

subplot(2,1,1);
plot(wave);
grid on;
title("Input Wave");
subplot(2,1,2);
plot(psd(:,2,1),psd(:,1,1));
grid on;
title("PSD");
print -dpng "psd_plots.png"
