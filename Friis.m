function [P_rec] = Friis(P_trans, G_trans, G_rec, f, range)
% Input: 
%     G_trans = Transmitter gain [db]
%     G_rec = receiver gain [db]
%     f = frequency [GHz]
%     range = range [m]
%
% Output:
%     P_rec = power received [W]

c = 3e8; % Speed of light [m/s]
f = f*10^9; % Conversion to Hz
lambda = c/f; % Wavelength

G_trans = 10^(G_trans/10); % Convert from db to power ratio
G_rec = 10^(G_rec/10); % Convert from db to power ratio

% Friis equation
P_rec = P_trans*G_trans*G_rec*(lambda/(4*pi*range))^2;

end

