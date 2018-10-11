function loss = fog_loss(dist,T,rho_agua)

f = 2.9E9; % Hz

% Calculate losses due to fog
for i = 1:numel(dist)
    loss(:,i) = fogpl_Test(dist(i),f,T,rho_agua);
end

end