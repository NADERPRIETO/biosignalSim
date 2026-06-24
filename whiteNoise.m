function [E, t] = whiteNoise(t_, mean, noiseRMS)

    %%% generates a white-noise-like waveform for the specified time values
    %%% RMS is used as std deviation

    t = zeros(1,size(t_,2));
    E = zeros(1, size(t_,2));

    for i=1:size(E,2)
        t(i) = t_(i);
        E(i) = mean + noiseRMS * randn(1);
    end

end