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
    count = 1;

    for i=1:n
        for j=1:nSamples
            t = [t, dt*(count-1)];
            count = count + 1;
            if j < nSamplesHigh
                wfm = [wfm, 1];
            else
                wfm = [wfm, 0];
            end
        end
    end

    if size(t,2) < size(t_,2)
        for i=1:(abs(size(t,2)-size(t_,2)))
            t = [t, dt*(count-1)];
            count = count + 1;
            wfm = [wfm, 1];
        end
    end

end