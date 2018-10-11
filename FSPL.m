% Christian Carmack
% FSPL function

function loss = FSPL(dStation)

% Horizontal distance to station
%dStation = 280E3;

% Approx Dist. at apogee
distMax = dStation;

distVector = linspace(1,distMax,1E5);

% Make sample vector of distance from station to satellite (Approx. 280 at
% apogee) this is subject to change through Ben's code
% for i = 1:length(dTemp)
%     d(i) = sqrt(dTemp(i).^2 + dStation.^2);
% end

% Frequency recieving and speed of light
f = 2.9E9;
c = 2.99792458E8;

% Free space path loss formula
fspl_1 = 10*log10((4*pi*distVector*f/c).^2);

plot(distVector,fspl_1)
hold on
xlabel('Distance')
ylabel('Path loss (dB)')

title('Free Space Path Loss')

% Plot using matlab function to double check
%lambda = c/f;

%L = fspl(distVector,lambda);

loss = fspl_1(end); %dB

%plot(distVector,L)
plot(distVector(end),loss,'or')
hold off

legend('Free Space Path Loss','Maximum Loss (apogee)','Location','southeast')
