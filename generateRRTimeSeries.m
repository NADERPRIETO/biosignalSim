function [T,w] = generateRRTimeSeries(s1,s2,c1,c2,f1,f2,dim)

    %%% Generate RR Time Series
    %%% Based on McSharry model (McSharry, 2003)
    
    f = linspace(1e-9,0.5,dim);f=f(1,:);
    S = zeros(size(f));S=S(1,:);
    T = zeros(size(S));T=T(1,:);
    complexSeries = zeros(size(S));complexSeries=complexSeries(1,:);
    w = zeros(size(T));w=w(1,:);
    
    %%% Spectrum
    for index = 1:(size(f,2))
        S(index) = ((s1^2)/(sqrt(2*pi*c1^2)))*exp(-((f(index)-f1)^2)/(2*c1^2))+((s2^2)/(sqrt(2*pi*c2^2)))*exp(-((f(index)-f2)^2)/(2*c2^2));
    end
    
    for i = 1:size(f,2)
        mag=sqrt(S(i));
        phase=rand()*2*pi;
        complexSeries(i) = complex(mag*cos(phase),mag*sin(phase));
    end
    
    T = real(ifft(complexSeries));
    T = T + ones(size(T,1));
    
    for i = 1:size(w,2)
        w(i) = (2*pi)/(T(i));
    end

end