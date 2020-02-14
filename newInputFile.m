Coupled = 1;
TwoCarriers = 1;
RC = 1;

nx = 200;
l = 1e-6;

x =linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;

NdChoice = input('Choose doping profile (1 for gradient, 2 for exponential: ');

if(NdChoice==1)
    Nd = linspace(1e16,20e16,nx); % Const. 1/cm3 (100 cm/m)^3
elseif(NdChoice==2)
    Nd = linspace(30,40,nx);
    Nd = exp(Nd);
end

NetDoping = ones(1,nx).*Nd; % doping

x0 = l/2;
nw = l/20;
npOnOff = input('Disturbances on or off?: ');

if(npOnOff==1)
    npDisturbance = 1e16*1e6*exp(-((x-x0)/nw).^2);
else
    npDisturbance = 0;
end

LVbc = 0;
RVbc = 0;

TStop = 14200000*1e-18;
PlDelt = 100000*1e-18;

%{
PlotYAxis = {[-1e-15 2e-15] [-2e-9 2e-9] [-1.5e-12 1.5e-12]...
    [1e22 2e22] [0 1e22] [0 20e43]...
    [-20e33 15e33] [-2.5e34 2e34] [-1.1e8 1.1e8] ...
    [-1e8 1e8] [-10e-3 10e-3] [0 2e22]};
%}

doPlotImage = 0;
PlotFile = 'Gau2CarRC.gif';
