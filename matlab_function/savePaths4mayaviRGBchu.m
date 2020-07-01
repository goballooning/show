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

%% coloring

% set color according to angle
%     [THETA,PHI,R] = cart2sph(x, y, z);
%     s = PHI;

% fiber color: choose v's first coordinate

if ~isfield(paths(1), 'v'), paths = pathsAddV(paths); end

% sv = rgb2hsv([paths(:).v]');
sv = ([paths(:).v]');

% s = sqrt(sv(:, 1).^2 + sv(:, 2).^2 /256 + sv(:, 3).^2 / 65536);
s = sv(:, 1)* 65536 + sv(:, 2)*256  + sv(:, 3) ;
s = s/max(x);
% current the s is used to show

%% save
save(fileName, 'x', 'y', 'z', 'connections', 's', '-v7');
disp([fileName, ' saved']);

end % of fucntion

