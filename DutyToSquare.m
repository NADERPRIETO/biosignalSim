function [wfm, t] = DutyToSquare(t_, n, D)
    
    %%% t = time vector
    %%% n = number of square wave cycles
    %%% D = duty cycle (%)

    cycleTime = t_(end)/n;
    dt = t_(2) - t_(1);

    nSamples = cycleTime/dt; % number of samples in a single square wave cycle
    nSamplesHigh = nSamples * D/100; % number of samples in high state

    wfm = [];
    t = [];

    for i=1:n
        for j=1:nSamples
            if j < nSamplesHigh
                wfm = [wfm, 1];
            else
                wfm = [wfm, 0];
            end
            %t = [t, dt*((i*j)-1)];
        end
    end

end