function [wfm, t, T] = generateECGPeriod(s1,s2,c1,c2,f1,f2,ti,th,a,b,dt)

    %%% Generate a single ECG period
    %%% Based on McSharry model (McSharry, 2003)
    
    %%% s1, s2, c1, c2, f1, f2: parameters for generateRRTimeSeries.m parameters
    %%% ti, th, a, b: PQRST parameters
    %%% dt = time step
    
    %%% wfm: waveform (Y values) of single ECG cycle
    %%% t_f = final time (should be t0+T)
    %%% T = RR time
    
    %%% Period, angular velocity
    [T, w] = generateRRTimeSeries(s1,s2,c1,c2,f1,f2,10);
    w = w(1);
    T = T(1);
    
    %%% time and waveform vectors
    t = ti(1):dt:(ti(1)+T);
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
    end

end