function [wfm,t] = addBLW(wfm_,t_,A,f)

    %%% Add baseline wander to a waveform
    %%% Based on McSharry model (McSharry, 2003)
    %%% wfm_: input waveform
    %%% t_: time values
    %%% A: baseline wander amplitude
    %%% f: baseline wander frequency (Hz)
    
    t = t_;
    wfm = wfm_;
    
    for i=1:size(t_,2)
        wfm(i) = wfm_(i) + A*sin(2*pi*f*t_(i));
    end

end