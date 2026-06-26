function [wfm, t] = DutyArrayToPWM(dutyArray,t_,dt,pwmScale)

    % dutyArray: array of duty cycle percentages (from 0 to 100)
    % t_: time vector of dutyArray
    % dt: desired sample time of the PWM carrier waveform
    % pwmScale: number of PWM waveform cycles per duty cycle value
    % (the size of the t and wfm vectors will be size of dutyArray multiplied by pwmScale)

    N = size(dutyArray,2); % number of duty cycles

    wfm = [];
    t = [];

    for i=1:N
        %%% a time interval and square wfm array are generated for each duty cycle
        t_ini = t_(i);
        if i == N
            break;
        else
            t_fin = t_(i+1);
        end
        %t_interval = t_ini:dt:t_fin-dt;
        samplesPerCycle = (t_fin - dt - t_ini)/dt;
        t_interval = linspace(t_ini,t_fin,samplesPerCycle);
        t = [t, t_interval];
        wfm_interval = DutyToSquare(t_interval - t_ini,pwmScale,dutyArray(i));
        wfm = [wfm, wfm_interval];
    end

end