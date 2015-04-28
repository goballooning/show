function saveImageVolum3d4mayavi(fileName, intensity, direction, spacing, origin)
% save 3d image volum for mayavi, from 3d or 4d volum
% intensity
%
% fileName, intensity, direction, spacing, origin
% leave direction as [], when intensity is 3D
% 
% when saving data with spacing and origin, use show -is
% 
% default origin adjusted in mayavi [0.5 0.5 0.5]

switch nargin
    case 1
        error('just on para');
    case 2
        save(fileName, 'intensity');
    case 3
        intensity = intensity(:,:,:, direction);
        save(fileName, 'intensity');
    case 4
        if isempty(direction)
            save(fileName, 'intensity', 'spacing');
        else
            intensity = intensity(:,:,:, direction);
            save(fileName, 'intensity', 'spacing');
        end
    case 5
        if isempty(direction)
            save(fileName, 'intensity', 'spacing', 'origin');
        else
            intensity = intensity(:,:,:, direction);
            save(fileName, 'intensity', 'spacing', 'origin');
        end
            
    otherwise
        disp('check nargin');
end


end % of function
