# biosignalSim

Functions:

The Matlab functions and Simulink models I made for my TFG.

Matlab functions are meant to simulate an ECG signal: create a flat (without baseline wander or random noise) waveform with generateNCycles.m; add baseline wander with addBLW.m; create random noise with whiteNoise.m; use wfmToDuty.m to transform the waveform into an array of duty cycle percentages for PWM.

The workspaces folder contains a few examples of simulated ECG signals, each about 15 seconds long, and the parameters that were used to generate them.

Simulink model can be used to send the waveforms to the PWM output of an STM32 microcontroller. Peripherals are configured in the biosignalSim.ioc file.