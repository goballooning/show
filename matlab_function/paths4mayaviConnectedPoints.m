function [x, y, z, connections] = paths4mayaviConnectedPoints(paths)
% for mayavi, to avoid creating large number of objects, virtually connect all fibers
%% here we go


% points' connections
cumLengths = cumsum([paths(:).length]');
totalPointsNum = cumLengths(end);
connections = (1:totalPointsNum)';
selection = true(totalPointsNum, 1);
for ilc = 1:length(cumLengths)
    selection(cumLengths(ilc)) = false;
end

connections = connections(selection);
connections = [connections-1, connections];

% cooridinates
loc = [paths(:).loc]';
x = loc(:,1);
y = loc(:,2);
z = loc(:,3);

end % of function
