%-------------- EMGdata 0 kg ---------------

emgBi0cFD = iddata(angle0cFR, [transpose(emgBi0cF), transpose(emgTr0cF), transpose(emgBr0cF)], 0.001);
emgBi0iFD = iddata(angle0iFR, [transpose(emgBi0iF), transpose(emgTr0iF), transpose(emgBr0iF)], 0.001);
emgData0 = merge(emgBi0cFD, emgBi0iFD);

emgData0.InputName = {'EMG Biceps','EMG Triceps','EMG Brachioradialis'};
emgData0.OutputName = 'Elbow angle';
emgData0.TimeUnit = 'seconds';
emgData0.InputUnit = {'EMG','EMG','EMG'};
emgData0.OutputUnit = 'Degrees';

%---- Data trimming

ze0 = emgData0(2001:8000);  
%ze0 = emgData0(6001:12000);  
ze0 = detrend(ze0);

zd0 = emgData0;
zd0 = detrend(zd0);



zd0a = getexp(zd0,[1]);
zd0a = zd0a(2001:end-2000);
zd0b = getexp(zd0,[2]);
zd0b = zd0b(2001:end-2000);
angle0a = zd0a.y;
angle0b = zd0b.y;

% angle0a = angle0cFR(2001:end-2000);
% angle0a = detrend(angle0a);
% angle0b = angle0iFR(2001:end-2000);
% angle0b = detrend(angle0b);
%-------------- EMGdata 1.5 kg ---------------

emgBi15cFD = iddata(angle15cFR, [transpose(emgBi15cF), transpose(emgTr15cF), transpose(emgBr15cF)], 0.001);
emgBi15iFD = iddata(angle15iFR, [transpose(emgBi15iF), transpose(emgTr15iF), transpose(emgBr15iF)], 0.001);
emgData15 = merge(emgBi15cFD, emgBi15iFD);

emgData15.InputName = {'EMG Biceps','EMG Triceps','EMG Brachioradialis'};
emgData15.OutputName = 'Elbow angle';
emgData15.TimeUnit = 'seconds';
emgData15.InputUnit = {'EMG','EMG','EMG'};
emgData15.OutputUnit = 'Degrees';

%---- Data trimming

ze15 = emgData15(2001:8000);    
%ze15 = emgData15(6001:12000);  
ze15 = detrend(ze15);

zd15 = emgData15;
zd15 = detrend(zd15);

zd15a = getexp(zd15,[1]);
zd15a = zd15a(2001:end-2000);
zd15b = getexp(zd15,[2]);
zd15b = zd15b(2001:end-2000);
angle15a = zd15a.y;
angle15b = zd15b.y;

% angle15a = angle15cFR(2001:end-2000);
% angle15a = detrend(angle15a);
% angle15b = angle15iFR(2001:end-2000);
% angle15b = detrend(angle15b);

%-------------- EMGdata 3 kg ---------------

emgBi3cFD = iddata(angle3cFR, [transpose(emgBi3cF), transpose(emgTr3cF), transpose(emgBr3cF)], 0.001);
emgBi3iFD = iddata(angle3iFR, [transpose(emgBi3iF), transpose(emgTr3iF), transpose(emgBr3iF)], 0.001);
emgData3 = merge(emgBi3cFD, emgBi3iFD);

emgData3.InputName = {'EMG Biceps','EMG Triceps','EMG Brachioradialis'};
emgData3.OutputName = 'Elbow angle';
emgData3.TimeUnit = 'seconds';
emgData3.InputUnit = {'EMG','EMG','EMG'};
emgData3.OutputUnit = 'Degrees';

%---- Data trimming

ze3 = emgData3(2001:8000); 
%ze3 = emgData3(6001:12000); 
ze3 = detrend(ze3);

zd3 = emgData3;
zd3 = detrend(zd3);

zd3a = getexp(zd3,[1]);
zd3a = zd3a(2001:end-2000);
zd3b = getexp(zd3,[2]);
angle3a = zd3a.y;
angle3b = zd3b.y;

% zd3b = zd3b(2001:end-2000);
% angle3a = angle3cFR(2001:end-2000);
% angle3a = detrend(angle3a);
% angle3b = angle3iFR(2001:end-2000);
% angle3b = detrend(angle3b);

%----------------- Initialization ----------------------------



m0a = armax(ze0,[1 [1 1 1] 1 [1 1 1]]);
m0b = armax(ze0,[1 [1 1 1] 1 [1 1 1]]);
m0c = armax(ze0,[1 [1 1 1] 1 [1 1 1]]);
m0d = armax(ze0,[1 [1 1 1] 1 [1 1 1]]);

m15a = armax(ze15,[1 [1 1 1] 1 [1 1 1]]);
m15b = armax(ze15,[1 [1 1 1] 1 [1 1 1]]);
m15c = armax(ze15,[1 [1 1 1] 1 [1 1 1]]);
m15d = armax(ze15,[1 [1 1 1] 1 [1 1 1]]);

m3a = armax(ze3,[1 [1 1 1] 1 [1 1 1]]);
m3b = armax(ze3,[1 [1 1 1] 1 [1 1 1]]);
m3c = armax(ze3,[1 [1 1 1] 1 [1 1 1]]);
m3d = armax(ze3,[1 [1 1 1] 1 [1 1 1]]);


mM = m0c;
aicMax = aic(m0c);

corrMax = 0;
corrMaxArx = 0;
corrMaxSS = 0;
corrMaxArmax = 0;
corrMaxArimax = 0;


% --------------------- Loop ------------------------

for ia = 1:10

a = randi([0 7],1,1);
b1 = randi([0 7],1,1);
b2 = randi([0 7],1,1);
b3 = randi([0 7],1,1);
c = randi([0 7],1,1);
k1= randi([0 7],1,1);
k2 = randi([0 7],1,1);
k3 = randi([0 7],1,1);
%k1 = 1;
%k2 = 1;
%k3 = 1;



ss = randi([0 3],1,1);
                

m0a = arx(ze0, [a [b1 b2 b3] [k1 k2 k3]]);
%m0b = n4sid(ze0,ss);
%m0c = armax(ze0,[a [b1 b2 b3] c [k1 k2 k3]]);
%m0d = armax(ze0,[a [b1 b2 b3] c [k1 k2 k3]], 'IntegrateNoise', true);

m15a = arx(ze15, [a [b1 b2 b3] [k1 k2 k3]]);
%m15b = n4sid(ze15,ss);
%m15c = armax(ze15,[a [b1 b2 b3] c [k1 k2 k3]]);
%m15d = armax(ze15,[a [b1 b2 b3] c [k1 k2 k3]], 'IntegrateNoise', true);

m3a = arx(ze3, [a [b1 b2 b3] [k1 k2 k3]]);
%m3b = n4sid(ze3,ss);
%m3c = armax(ze3,[a [b1 b2 b3] c [k1 k2 k3]]);
%m3d = armax(ze3,[a [b1 b2 b3] c [k1 k2 k3]], 'IntegrateNoise', true);


%sys = tfest(ze0, 5, 5);

%compare (ze0,m0a,m0b,m0c)
%compare (ze0,m0c)

% aicAtual = aic(m0c);
% if aicAtual < aicMax
%     aicMax = aicAtual;
%     mF = m0c;
% end


%------------ARX---------------

y3 = compare(zd0a,m0a);
y3 = y3.y;
corrAtual0a = corr2(y3, angle0a);
y4 = compare(zd0b,m0a);
y4 = y4.y;
corrAtual0b = corr2(y4, angle0b);
RMSE0a = sqrt(mean((y3 - angle0a).^2));
RMSE0b = sqrt(mean((y4 - angle0b).^2));

y3 = compare(zd15a,m15a);
y3 = y3.y;
corrAtual15a = corr2(y3, angle15a);
y4 = compare(zd15b,m15a);
y4 = y4.y;
corrAtual15b = corr2(y4, angle15b);
RMSE15a = sqrt(mean((y3 - angle15a).^2));
RMSE15b = sqrt(mean((y4 - angle15b).^2));

y3 = compare(zd3a,m3a);
y3 = y3.y;
corrAtual3a = corr2(y3, angle3a);
y4 = compare(zd3b,m3a);
y4 = y4.y;
corrAtual3b = corr2(y4, angle3b);
RMSE3a = sqrt(mean((y3 - angle3a).^2));
RMSE3b = sqrt(mean((y4 - angle3b).^2));


corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b)/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
%corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b));
%corrAtual = sqrt(1/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));

if corrAtual>corrMaxArx
    corrMaxArx = corrAtual;
    mM0Arx = m0a;
    mM15Arx = m15a;
    mM3Arx = m3a;
end

if corrAtual>corrMax & RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b < 1000000000
    corrMax = corrAtual;
    mM0 = m0a;
    mM15 = m15a;
    mM3 = m3a;
end

% %--------State-Space-----------
% 
% y3 = compare(zd0a,m0b);
% y3 = y3.y;
% corrAtual0a = corr2(y3, angle0a);
% y4 = compare(zd0b,m0b);
% y4 = y4.y;
% corrAtual0b = corr2(y4, angle0b);
% RMSE0a = sqrt(mean((y3 - angle0a).^2));
% RMSE0b = sqrt(mean((y4 - angle0b).^2));
% 
% y3 = compare(zd15a,m15b);
% y3 = y3.y;
% corrAtual15a = corr2(y3, angle15a);
% y4 = compare(zd15b,m15b);
% y4 = y4.y;
% corrAtual15b = corr2(y4, angle15b);
% RMSE15a = sqrt(mean((y3 - angle15a).^2));
% RMSE15b = sqrt(mean((y4 - angle15b).^2));
% 
% y3 = compare(zd3a,m3b);
% y3 = y3.y;
% corrAtual3a = corr2(y3, angle3a);
% y4 = compare(zd3b,m3b);
% y4 = y4.y;
% corrAtual15b = corr2(y4, angle3b);
% RMSE15a = sqrt(mean((y3 - angle3a).^2));
% RMSE15b = sqrt(mean((y4 - angle3b).^2));
% 
% 
% corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b)/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
% %corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b));
% %corrAtual = sqrt(1/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
% 
% if corrAtual>corrMaxSS
%     corrMaxSS = corrAtual;
%     mM0SS = m0b;
%     mM15SS = m15b;
%     mM3SS = m3b;
% end
% 
% if corrAtual>corrMax & RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b < 1000000000
%     corrMax = corrAtual;
%     mM0 = m0b;
%     mM15 = m15b;
%     mM3 = m3b;
% end
% 
% %--------ARMAX-----------
% 
% y3 = compare(zd0a,m0c);
% y3 = y3.y;
% corrAtual0a = corr2(y3, angle0a);
% y4 = compare(zd0b,m0c);
% y4 = y4.y;
% corrAtual0b = corr2(y4, angle0b);
% RMSE0a = sqrt(mean((y3 - angle0a).^2));
% RMSE0b = sqrt(mean((y4 - angle0b).^2));
% 
% y3 = compare(zd15a,m15c);
% y3 = y3.y;
% corrAtual15a = corr2(y3, angle15a);
% y4 = compare(zd15b,m15c);
% y4 = y4.y;
% corrAtual15b = corr2(y4, angle15b);
% RMSE15a = sqrt(mean((y3 - angle15a).^2));
% RMSE15b = sqrt(mean((y4 - angle15b).^2));
% 
% y3 = compare(zd3a,m3c);
% y3 = y3.y;
% corrAtual3a = corr2(y3, angle3a);
% y4 = compare(zd3b,m3c);
% y4 = y4.y;
% corrAtual15b = corr2(y4, angle3b);
% RMSE15a = sqrt(mean((y3 - angle3a).^2));
% RMSE15b = sqrt(mean((y4 - angle3b).^2));
% 
% 
% corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b)/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
% %corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b));
% %corrAtual = sqrt(1/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
% 
% if corrAtual>corrMaxArmax
%     corrMaxArmax = corrAtual;
%     mM0Armax = m0c;
%     mM15Armax = m15c;
%     mM3Armax = m3c;
% end
% 
% if corrAtual>corrMax & RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b < 1000000000
%     corrMax = corrAtual;
%     mM0 = m0c;
%     mM15 = m15c;
%     mM3 = m3c;
% end
% 
% %-----------ARIMAX---------
% 
% y3 = compare(zd0a,m0d);
% y3 = y3.y;
% corrAtual0a = corr2(y3, angle0a);
% y4 = compare(zd0b,m0d);
% y4 = y4.y;
% corrAtual0b = corr2(y4, angle0b);
% RMSE0a = sqrt(mean((y3 - angle0a).^2));
% RMSE0b = sqrt(mean((y4 - angle0b).^2));
% 
% y3 = compare(zd15a,m15d);
% y3 = y3.y;
% corrAtual15a = corr2(y3, angle15a);
% y4 = compare(zd15b,m15d);
% y4 = y4.y;
% corrAtual15b = corr2(y4, angle15b);
% RMSE15a = sqrt(mean((y3 - angle15a).^2));
% RMSE15b = sqrt(mean((y4 - angle15b).^2));
% 
% y3 = compare(zd3a,m3d);
% y3 = y3.y;
% corrAtual3a = corr2(y3, angle3a);
% y4 = compare(zd3b,m3d);
% y4 = y4.y;
% corrAtual15b = corr2(y4, angle3b);
% RMSE15a = sqrt(mean((y3 - angle3a).^2));
% RMSE15b = sqrt(mean((y4 - angle3b).^2));
% 
% 
% corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b)/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
% %corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b));
% %corrAtual = sqrt(1/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
% 
% if corrAtual>corrMaxArmax
%     corrMaxArimax = corrAtual;
%     mM0Arimax = m0d;
%     mM15Arimax = m15d;
%     mM3Arimax = m3d;
% end
% 
% if corrAtual>corrMax & RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b < 1000000000
%     corrMax = corrAtual;
%     mM0 = m0d;
%     mM15 = m15d;
%     mM3 = m3d;
% end
% 
% %---------------------------

ia
     
end

compare(zd0a,mM0)
figure;
compare(zd0b,mM0)
y1 = compare(zd0a,mM0);
y1 = y1.y;
corrAtual0a = corr2(y1, angle0a)
y2 = compare(zd0b,mM0);
y2 = y2.y;
corrAtual0b = corr2(y2, angle0b)

RMSE0a = sqrt(mean((y1 - angle0a).^2))
RMSE0b = sqrt(mean((y2 - angle0b).^2))