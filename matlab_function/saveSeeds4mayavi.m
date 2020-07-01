function saveSeeds4mayavi(varargin)


%% default output file name

if nargin == 1
    fileName = '~/s';
    paths = varargin{1};
else
    fileName = varargin{1};
    paths = varargin{2};
end

%%

seedPoints = [];
for lp = 1 : length(paths)
    seedPoints = [seedPoints, paths(lp).loc(:,1)];
end

x = seedPoints(1, :);
y = seedPoints(2, :);
z = seedPoints(3, :);

save(fileName, 'x', 'y', 'z', '-v7');

end %
