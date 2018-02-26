%-------------- EMGdata 0 kg ---------------

emgBi0cFD = iddata(angle0cFR, [transpose(emgBi0cF), transpose(emgTr0cF), transpose(emgBr0cF)], 0.001);      %Data variable definition
emgBi0iFD = iddata(angle0iFR, [transpose(emgBi0iF), transpose(emgTr0iF), transpose(emgBr0iF)], 0.001);
emgData0 = merge(emgBi0cFD, emgBi0iFD);

emgData0.InputName = {'EMG Biceps','EMG Triceps','EMG Brachioradialis'};
emgData0.OutputName = 'Elbow angle';
emgData0.TimeUnit = 'seconds';
emgData0.InputUnit = {'EMG','EMG','EMG'};
emgData0.OutputUnit = 'Degrees';

%---- Data trimming -------

zd0 = emgData0;
zd0 = detrend(zd0);

ze0 = zd0(2001:6000);                   % Data vector range for model fitting


% ze0 = emgData0(2001:6000);  
% %ze0 = emgData0(6001:12000);  
% ze0 = detrend(ze0);
% 
% zd0 = emgData0;
% zd0 = detrend(zd0);



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

%---- Data trimming ----------


zd15 = emgData15;
zd15 = detrend(zd15);

ze15 = zd15(2001:6000);

% ze15 = emgData15(2001:6000);    
% %ze15 = emgData15(6001:12000);  
% ze15 = detrend(ze15);
% 
% zd15 = emgData15;
% zd15 = detrend(zd15);

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

%---- Data trimming ---------

zd3 = emgData3;
zd3 = detrend(zd3);

ze3 = zd3(2001:6000);

% ze3 = emgData3(2001:6000); 
% %ze3 = emgData3(6001:12000); 
% ze3 = detrend(ze3);
% 
% zd3 = emgData3;
% zd3 = detrend(zd3);

zd3a = getexp(zd3,[1]);
zd3a = zd3a(2001:end-2000);
zd3b = getexp(zd3,[2]);
zd3b = zd3b(2001:end-2000);
angle3a = zd3a.y;
angle3b = zd3b.y;

% angle3a = angle3cFR(2001:end-2000);
% angle3a = detrend(angle3a);
% angle3b = angle3iFR(2001:end-2000);
% angle3b = detrend(angle3b);

%----------------- Initialization ----------------------------



m0a = armax(ze0,[1 [1 1 1] 1 [1 1 1]]);     % Model initialization
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

mM0 = m0a;
mM15 = m0a;
mM3 = m0a;

mM0a = m0a;
mM15a = m0a;
mM3a = m0a;

mM0b = m0a;
mM15b = m0a;
mM3b = m0a;

mM0aic = m0a;
mM15aic = m0a;
mM3aic = m0a;

mM0aaic = m0a;
mM15aaic = m0a;
mM3aaic = m0a;

mM0baic = m0a;
mM15baic = m0a;
mM3baic = m0a;

mM0aicC = m0a;
mM15aicC = m0a;
mM3aicC = m0a;

mM0aaicC = m0a;
mM15aaicC = m0a;
mM3aaicC = m0a;

mM0baicC = m0a;
mM15baicC = m0a;
mM3baicC = m0a;

rmseMax = 15;               % Maximum allowed Root Mean Square Error (RMSE) for AIC corrected models
orderMax = 15;              % Maximum order range for model search
mM = m0c;

minAIC = 10000000000;

corrMax = 0;

% --------------------- Loop ------------------------

for ia = 1:1000

a1 = randi([0 orderMax],1,1);               % Random order generation
a2 = randi([0 orderMax],1,1);
a3 = randi([0 orderMax],1,1);
b1 = randi([0 orderMax],1,1);
b2 = randi([0 orderMax],1,1);
b3 = randi([0 orderMax],1,1);
c = randi([0 orderMax],1,1);
k1= randi([0 orderMax],1,1);
k2 = randi([0 orderMax],1,1);
k3 = randi([0 orderMax],1,1);
%k1 = 1;
%k2 = 1;
%k3 = 1;

if a1 == 0 & a2 == 0 & a3 == 0
    a1 = 1;
end

m0a = nlhw(ze0, [[a1 a2 a3] [b1 b2 b3] [k1 k2 k3]]);    % Select Model Estimation Method by uncommenting the function: NLHW (Non Linear Hammerstein Wiener model), n4sid(space state model) armax(ARMAX model), ARMAX('Integrate Noise')(ARIMAX)
%m0b = n4sid(ze0,ss);
%m0c = armax(ze0,[a [b1 b2 b3] c [k1 k2 k3]]);
%m0d = armax(ze0,[a [b1 b2 b3] c [k1 k2 k3]], 'IntegrateNoise', true);

m15a = nlhw(ze15, [[a1 a2 a3] [b1 b2 b3] [k1 k2 k3]]);
%m15b = n4sid(ze15,ss);
%m15c = armax(ze15,[a [b1 b2 b3] c [k1 k2 k3]]);
%m15d = armax(ze15,[a [b1 b2 b3] c [k1 k2 k3]], 'IntegrateNoise', true);

m3a = nlhw(ze3, [[a1 a2 a3] [b1 b2 b3] [k1 k2 k3]]);
%m3b = n4sid(ze3,ss);
%m3c = armax(ze3,[a [b1 b2 b3] c [k1 k2 k3]]);
%m3d = armax(ze3,[a [b1 b2 b3] c [k1 k2 k3]], 'IntegrateNoise', true);


%sys = tfest(ze0, 5, 5);            % Model estimation using transfer function.       

%compare (ze0,m0a,m0b,m0c)
%compare (ze0,m0c)

% aicAtual = aic(m0c);
% if aicAtual < aicMax
%     aicMax = aicAtual;
%     mF = m0c;
% end


%------------Hammerstein-Weiner---------------

y3 = compare(zd0a,m0a);                 % Compare estimation with measured data
y3 = y3.y;
corrAtual0a = corr2(y3, angle0a);       % Calculate correlation between estimated and measured data
y4 = compare(zd0b,m0a);
y4 = y4.y;
corrAtual0b = corr2(y4, angle0b);
RMSE0a = sqrt(mean((y3 - angle0a).^2)); % Calculate RMSE between estimated and measured data
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


%corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b)/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));
corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b)/(RMSE0a+RMSE0b+RMSE15a+RMSE15b+RMSE3a+RMSE3b));   % merging every correlation and RMSE in one fitness evaluation variable
%corrAtual = sqrt((corrAtual0a*corrAtual0b*corrAtual15a*corrAtual15b*corrAtual3a*corrAtual3b));
%corrAtual = sqrt(1/(RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b));

%AIC = aic(m0a)*aic(m15a)*aic(m3a);
AIC = aic(m0a)+aic(m15a)+aic(m3a);


if corrAtual>corrMax & RMSE0a*RMSE0b*RMSE15a*RMSE15b*RMSE3a*RMSE3b < 1000000000         % Register best models based on correlation and RMSE
    corrMax = corrAtual;
    
    mM0b = mM0a;
    mM15b = mM15a;
    mM3b = mM3a;
    
    mM0a = mM0;
    mM15a = mM15;
    mM3a = mM3;
    
    mM0 = m0a;
    mM15 = m15a;
    mM3 = m3a;
    
    
end

if AIC<minAIC          % Register best models based on Akaike Information Criteria (AIC)
    minAIC = AIC;
    
    mM0baic = mM0aaic;
    mM15baic = mM15aaic;
    mM3baic = mM3aaic;  
    
    mM0aaic = mM0aic;
    mM15aaic = mM15aic;
    mM3aaic = mM3aic;  
    
    mM0aic = m0a;
    mM15aic = m15a;
    mM3aic = m3a;   
     
    if RMSE0a<rmseMax & RMSE0b<rmseMax & RMSE15a<rmseMax & RMSE15b<rmseMax & RMSE3a<rmseMax & RMSE3b<rmseMax          % Registering models with best AIC with RMSE below rmseMax
        minAIC = AIC;
    
        mM0baicC = mM0aaicC;
        mM15baicC = mM15aaicC;
        mM3baicC = mM3aaicC;  
    
        mM0aaicC = mM0aicC;
        mM15aaicC = mM15aicC;
        mM3aaicC = mM3aicC;  
    
        mM0aicC = m0a;
        mM15aicC = m15a;
        mM3aicC = m3a;
    end
    
end


% %---------------------------

ia
     
end

% ------- Printing Results ------------

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