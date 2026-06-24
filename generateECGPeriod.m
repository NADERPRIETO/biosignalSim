function [wfm, t, T] = generateECGPeriod(s1,s2,c1,c2,f1,f2,ti,th,a,b,t0,dt)

    %%% Generate a single ECG period
    %%% Based on McSharry model (McSharry, 2003)
    
    %%% s1, s2, c1, c2, f1, f2: parameters for generateRRTimeSeries.m parameters
    %%% ti, th, a, b: PQRST parameters
    %%% t0: initial time
    %%% dt: time step
    
    %%% wfm: waveform (Y values) of single ECG cycle
    %%% t: time vector
    %%% T: period
    
    %%% Period, angular velocity
    [T, w] = generateRRTimeSeries(s1,s2,c1,c2,f1,f2,10);
    w = w(1);
    T = T(1);
    
    %%% time and waveform vectors
    t_ini = ti(1);
    t_fin = t_ini + T;
    t = t_ini:dt:t_fin;
    wfm = zeros(1,size(t,2));
    
    %%% Basic ECG waveform
    for i = 1:size(t,2)
        angle = th(1) + w*(t(i));
        x = 1*cos(angle);
        y = 1*sin(angle);
        z = 0;
        theta = atan2(y,x);
        for index = 1:5
            dth = mod((theta-th(index)),2*pi);
            z = z + (a(index)*dth*exp(-dth^2/(2*b(index)^2)));
        end
        wfm(i) = z;
        t(i) = t(i) + t0;
    end

end