function loss = Gas_loss(distance,T,P,rho_vapor)

f = 2.9E9;

% Loss due to gasses 
for i = 1:numel(distance)
loss = gaspl(distance(i),f,T,P,rho_vapor);
end