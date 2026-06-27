function [wfm_pwm,t_pwm,dt_pwm] = dutyArrayToPWM2(dutyArray,dt_D,f_pwm)

    %%% This function generates the equivalent PWM wave from an array of
    %%% duty cycles (percentages)

    N = length(dutyArray);
    wfmDuration = N * dt_D;

    dutyArraySorted = sort(dutyArray,2,"ascend");
    if dutyArraySorted(1) == 0
        minD = dutyArraySorted(2);
    else
        minD = dutyArraySorted(1);
    end
    pwm_samplesPerCycle = 1/minD; %% number of samples per pwm cycle
    

    wfm_pwm = [];

    for i=1:N
        %%% Generate square waveform for each duty cycle
        samplesHigh = round(pwm_samplesPerCycle * dutyArray(i)/100); % number of samples at high level
        for j=1:pwm_samplesPerCycle
            if j <= samplesHigh
                wfm_pwm = [wfm_pwm, 1];
            else
                wfm_pwm = [wfm_pwm, 0];
            end
        end
    end

    t_pwm = linspace(0,wfmDuration,length(wfm_pwm));
    dt_pwm = t_pwm(2) - t_pwm(1);

end