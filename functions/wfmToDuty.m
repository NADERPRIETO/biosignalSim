function [wfmD, wfmCounts, offset] = wfmToDuty(wfm,maxCounts,ARR)

%%% Turns the input waveform into a series of PWM duty cycles (%)
%%% maxCounts is the number of counts needed to get the maximum wfm value (could be ARR or less, for example if your pin is 0-5V but if you need a maximum output voltage of less than 5V, it might interest you to set a lower maxCount value)

if min(wfm) < 0
    %%% Removes negative values
    offset = abs(min(wfm));
else
    offset = 0;
end

wfm = wfm + offset;
wfmCounts = wfm * (maxCounts/max(wfm));
wfmD = (wfmCounts/ARR)*100;

end