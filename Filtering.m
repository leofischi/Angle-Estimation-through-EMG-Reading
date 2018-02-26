% the variable "emg..." is the data vector for EMG
% Bi is Biceps muscle, Tr is Triceps muscle and Br is Brachioradialis
% muscle;
% Mvc is for the Maximum Voluntary Contraction Test;
% 0 is for the 0kg test, 15 is for the 1.5 kg test and 3 is for the 3 kg
% test;
% c is for continuous movement and i is for intermittent movement
% F is for "Filtered" data vector
%
% Example: emgBi15cF is the data vector for emg data from biceps muscle,
% with 1.5kg extra weight, in continuous movement, after filtering
% procedure.


% --------------- Filtering ----------------- 

[b1,a1] = butter(2,30/(1000/2), 'high');        % Butterworth High pass filter design (order, Fc/(Facq/2))
[b2,a2] = butter(2,1/(1000/2));                 % Butterworth Low pass filter design
MvcBi = max(emgBiMvc);                          % Maximum Voluntary Contraction (MVC)
MvcTr = max(emgTrMvc);
MvcBr = max(emgBrMvc);

filtered = filter(b1,a1,emgBi0c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBi0cF = filtered/MvcBi;                     % divided by Mvc

filtered = filter(b1,a1,emgBi0i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBi0iF = filtered/MvcBi;                     % divided by Mvc

filtered = filter(b1,a1,emgBi15c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBi15cF = filtered/MvcBi;                     % divided by Mvc

filtered = filter(b1,a1,emgBi15i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBi15iF = filtered/MvcBi;                     % divided by Mvc

filtered = filter(b1,a1,emgBi3c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBi3cF = filtered/MvcBi;                     % divided by Mvc

filtered = filter(b1,a1,emgBi3i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBi3iF = filtered/MvcBi;                     % divided by Mvc

filtered = filter(b1,a1,emgTr0c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgTr0cF = filtered/MvcTr;                     % divided by Mvc

filtered = filter(b1,a1,emgTr0i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgTr0iF = filtered/MvcTr;                     % divided by Mvc

filtered = filter(b1,a1,emgTr15c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgTr15cF = filtered/MvcTr;                     % divided by Mvc

filtered = filter(b1,a1,emgTr15i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgTr15iF = filtered/MvcTr;                     % divided by Mvc

filtered = filter(b1,a1,emgTr3c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgTr3cF = filtered/MvcTr;                     % divided by Mvc

filtered = filter(b1,a1,emgTr3i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgTr3iF = filtered/MvcTr;                     % divided by Mvc



filtered = filter(b1,a1,emgBr0c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBr0cF = filtered/MvcBr;                     % divided by Mvc

filtered = filter(b1,a1,emgBr0i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBr0iF = filtered/MvcBr;                     % divided by Mvc

filtered = filter(b1,a1,emgBr15c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBr15cF = filtered/MvcBr;                     % divided by Mvc

filtered = filter(b1,a1,emgBr15i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBr15iF = filtered/MvcBr;                     % divided by Mvc

filtered = filter(b1,a1,emgBr3c);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBr3cF = filtered/MvcBr;                     % divided by Mvc

filtered = filter(b1,a1,emgBr3i);              % High Pass Filtering
filtered = abs(filtered);                      % Rectification
filtered = filter(b2,a2,filtered);             % Low pass Filtering
emgBr3iF = filtered/MvcBr;                     % divided by Mvc


%------------ Resampling Angular Data -------------------

angle = resample(angle0c, 10, 1);
angle0cF = angle(5001:16000);
emgBi0cF = emgBi0cF(1:11000);
emgTr0cF = emgTr0cF(1:11000);
emgBr0cF = emgBr0cF(1:11000);

angle = resample(angle0i, 10, 1);
angle0iF = angle(5001:25000);
emgBi0iF = emgBi0iF(1:20000);
emgTr0iF = emgTr0iF(1:20000);
emgBr0iF = emgBr0iF(1:20000);

angle = resample(angle15c, 10, 1);
angle15cF = angle(5001:16000);
emgBi15cF = emgBi15cF(1:11000);
emgTr15cF = emgTr15cF(1:11000);
emgBr15cF = emgBr15cF(1:11000);

angle = resample(angle15i, 10, 1);
angle15iF = angle(5001:25000);
emgBi15iF = emgBi15iF(1:20000);
emgTr15iF = emgTr15iF(1:20000);
emgBr15iF = emgBr15iF(1:20000);

angle = resample(angle3c, 10, 1);
angle3cF = angle(5001:16000);
emgBi3cF = emgBi3cF(1:11000);
emgTr3cF = emgTr3cF(1:11000);
emgBr3cF = emgBr3cF(1:11000);

angle = resample(angle3i, 10, 1);
angle3iF = angle(5001:24000);
emgBi3iF = emgBi3iF(1:19000);
emgTr3iF = emgTr3iF(1:19000);
emgBr3iF = emgBr3iF(1:19000);

%------------ Aligning signals ---------------

emgBi0cF = alignsignals(emgBi0cF, angle0cF);   % aligning signals
emgBi0iF = alignsignals(emgBi0iF, angle0iF);   % aligning signals
%emgBi0iF = circshift(emgBi0iF,[1,1500]); %Correçao Juliana1
emgBi15cF = alignsignals(emgBi15cF, angle15cF);   % aligning signals
% emgBi15cF = circshift(emgBi15cF,[1,-500]); %Correçao Regina
emgBi15iF = alignsignals(emgBi15iF, angle15iF);   % aligning signals
%emgBi15iF = circshift(emgBi15iF,[1,2000]); %Correçao Juliana1
emgBi3cF = alignsignals(emgBi3cF, angle3cF);   % aligning signals
emgBi3iF = alignsignals(emgBi3iF, angle3iF);   % aligning signals
emgTr0cF = alignsignals(emgTr0cF, angle0cF);   % aligning signals
emgTr0iF = alignsignals(emgTr0iF, angle0iF);   % aligning signals
%emgTr0iF = circshift(emgTr0iF,[1,2000]); %Correçao Juliana1
emgTr15cF = alignsignals(emgTr15cF, angle15cF);   % aligning signals
emgTr15iF = alignsignals(emgTr15iF, angle15iF);   % aligning signals
emgTr3cF = alignsignals(emgTr3cF, angle3cF);   % aligning signals
emgTr3iF = alignsignals(emgTr3iF, angle3iF);   % aligning signals
emgBr0cF = alignsignals(emgBr0cF, angle0cF);   % aligning signals
emgBr0iF = alignsignals(emgBr0iF, angle0iF);   % aligning signals
%emgBr0iF = circshift(emgBr0iF,[1,2000]); %Correçao Juliana1
emgBr15cF = alignsignals(emgBr15cF, angle15cF);   % aligning signals
% emgBr15cF = circshift(emgBr15cF,[1,-400]); %Correçao Regina
emgBr15iF = alignsignals(emgBr15iF, angle15iF);   % aligning signals
emgBr3iF = alignsignals(emgBr3iF, angle3iF);   % aligning signals
emgBr3cF = alignsignals(emgBr3cF, angle3cF);   % aligning signals


% ------- trimming EMG data -----------

emgBi0cF = emgBi0cF(1:11000);
emgTr0cF = emgTr0cF(1:11000);
emgBr0cF = emgBr0cF(1:11000);
emgBi0iF = emgBi0iF(1:20000);
emgTr0iF = emgTr0iF(1:20000);
emgBr0iF = emgBr0iF(1:20000);
emgBi15cF = emgBi15cF(1:11000);
emgTr15cF = emgTr15cF(1:11000);
emgBr15cF = emgBr15cF(1:11000);
emgBi15iF = emgBi15iF(1:20000);
emgTr15iF = emgTr15iF(1:20000);
emgBr15iF = emgBr15iF(1:20000);
emgBi3cF = emgBi3cF(1:11000);
emgTr3cF = emgTr3cF(1:11000);
emgBr3cF = emgBr3cF(1:11000);
emgBi3iF = emgBi3iF(1:19000);
emgTr3iF = emgTr3iF(1:19000);
emgBr3iF = emgBr3iF(1:19000);


%angle = resample(angle0i, 10, 1);
%sz = size(emgBi0iF) + 5000;
%angle0iF = angle(5001:sz(2));


% ------- Filtering Angles ------------

[b3,a3] = butter(2,20/(1000/2));         % filter definition

angle0cFR = filtfilt(b3,a3,angle0cF);   % filtering continuous angle
angle0iFR = filtfilt(b3,a3,angle0iF);   % filtering intermittent angle
angle15cFR = filtfilt(b3,a3,angle15cF);   % filtering continuous angle
angle15iFR = filtfilt(b3,a3,angle15iF);   % filtering intermittent angle
angle3cFR = filtfilt(b3,a3,angle3cF);   % filtering continuous angle
angle3iFR = filtfilt(b3,a3,angle3iF);   % filtering intermittent angle





