function [wfm, t, T] = generateNCycles(s1,s2,c1,c2,f1,f2,ti,th,a,b,t0,dt,n)

    %%% Generate a given number of ECG cycles
    %%% Based on McSharry model (McSharry, 2003)

    %%% s1, s2, c1, c2, f1, f2: parameters for generateRRTimeSeries.m parameters
    %%% ti, th, a, b: PQRST parameters
    %%% t0: initial time
    %%% dt: time step

    %%% wfm: waveform (Y values)
    %%% t: time vector
    %%% T: period (RR times) vector

    cycle_count = 0;
    wfm_b = [];
    t_b = [];
    T_b = [];

    while cycle_count < n
        [wfm, t, T] = generateECGPeriod(s1,s2,c1,c2,f1,f2,ti,th,a,b,t0,dt);
        wfm_b = [wfm_b, wfm];
        t_b = [t_b, t];
        T_b = [T_b,T];
        t0 = t0 + T;
        cycle_count = cycle_count + 1;
    end

    wfm = wfm_b;
    t = t_b;
    T = T_b;

end