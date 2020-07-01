function savePoints4mayavi(fileName, points)
% points 3*x

if ~isempty(points)

    x = points(1,:);
    y = points(2,:);
    z = points(3,:);
    
    if nargin == 2
        save(fileName, 'x', 'y', 'z', '-v7');
    else
        save('~/p', 'x', 'y', 'z', '-v7');
    end
    
    disp('all the points: ');
    disp(num2str(points));

else
    warning('no points');
end

end %


