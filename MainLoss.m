% Christian Carmack
% 2/26/18

% This script will ideally calculate all the losses on the signal at apogee

clear all; close all; clc

% dTemp = 280E3; % Temporary station distance
% distMax = sqrt(dTemp.^2 + (1E5).^2);
distMax = 292.9E3; % arbitrary station distance chosen from Ben's code
distance = linspace(0,distMax,150);
altitude = linspace(0,150E3,150);

%%

%[T, a, P, rho] = atmoslapse(altitude, 9.81, 1005, .287, .0065, 12000, 12000, 1.225, 101,325 , 288)
%%
% Free space path loss (implement ben's distances)
loss_FS = FSPL(distMax);

%%
% Loss due to rain (potentially)
rainRate = 10; % mm/h (dependent on the day)
%el = linspace(1,150E3,1000); % elevation (implement from ben's code)
el = 63; % Angles changing from ben
tau = 360; % horizontal polarization (idk what this is)
loss_rain = rain_loss(distance,rainRate,el,tau);

%%
% Loss due to fog/clouds
T = -104.2781; % Temp in degrees celsius at 100 km (depends) 
rho_agua = .05; % g/m^3 (depends on day, also probably way less than this)
loss_fog = fog_loss(distance,T,rho_agua);
 
%% 
% Loss due to gases
P = 2.89E-2; % Pa at 100 km
rho_vapor = 7.5; % g/m^3, water vapour density, not really sure
loss_gas = Gas_loss(distance,T,P,rho_vapor);

% Total loss due to atmosphere (dB)
Loss_atmosphere = sum(loss_rain) + sum(loss_fog) + sum(loss_gas);
%% Model signal (In Progress)
circumference = 2*pi*distMax;
signalLoss = linspace(0,circumference,1000); % Due to side lobes/back lobes


