function inputPaths = savePaths4mayaviRGBchu(varargin)
% fileName, inputPaths
%function [x, y, z, s, connections] = savePaths4mayavi(fileName, paths)
%
% input:    struct 
%           or cell of struct


if length(varargin) == 1
    % default output file name
    fileName = '~/f';
    inputPaths = varargin{1};
else
    fileName = varargin{1};
    inputPaths = varargin{2};
end

%% check input paths type: struct or cell of struct
if isstruct(inputPaths)
    paths = inputPaths;
    
elseif iscell(inputPaths)
    % cellPaths{N} is a struct
    paths = [inputPaths{:}];
else
    error('--> unsupported data type')
end

%% empty ?

if isempty(paths)
    warning('no paths')
    return;
end

%% fiber paths 2 ConnectedPoints

[x, y, z, connections] = paths4mayaviConnectedPoints(paths);
% use paths4mayaviConnectedPoints.m instead
%%% %% here we go
%%% % points' connections
%%% cumLengths = cumsum([paths(:).length]');
%%% totalPointsNum = cumLengths(end);
%%% connections = (1:totalPointsNum)';
%%% selection = true(totalPointsNum, 1);
%%% for ilc = 1:length(cumLengths)
%%%     selection(cumLengths(ilc)) = false;
%%% end
%%% 
%%% connections = connections(selection);
%%% connections = [connections-1, connections];
%%% 
%%% % cooridinates
%%% loc = [paths(:).loc]';
%%% x = loc(:,1);
%%% y = loc(:,2);
%%% z = loc(:,3);

%% coloring

% set color according to angle
%     [THETA,PHI,R] = cart2sph(x, y, z);
%     s = PHI;

% fiber color: choose v's first coordinate

if ~isfield(paths(1), 'v'), paths = pathsAddV(paths); end

% sv = rgb2hsv([paths(:).v]');
sv = ([paths(:).v]');
s = sv(:,1);
s2 = sv(:,2);
s3 = sv(:,3);

% s = sqrt(sv(:, 1).^2 + sv(:, 2).^2 /256 + sv(:, 3).^2 / 65536);
s = sv(:, 1)* 65536 + sv(:, 2)*256  + sv(:, 3) ;

s = s/max(x);
% current the s is used to show

%% save
save(fileName, 'x', 'y', 'z', 'connections', 's', 's2', 's3');
disp([fileName, ' saved']);

end % of fucntion


