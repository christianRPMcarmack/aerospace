function loss = rain_loss(distance,rainRate,el,tau)

f = 2.9E9;
%distTest = ones(1,length(tau))*distMax;
% Rain loss function
for i = 1:numel(distance)
    loss(:,i) = rainpl(distance(i),f,rainRate,el,tau);
end

% for i = 1:numel(distTest)
%     loss(:,i) = rainpl(distTest(i),f,rainRate,el,tau(i));
% end

end
