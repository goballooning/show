function [points, vectors] = saveVectors4mayavi(fileName, tensorEstimation, sliceId)
% single silice or the whole volumn
% data, 'spacing'. []'


%%
% selection 1:sel:s(.)
sel = 1;

if isfield(tensorEstimation, 'E')
    V = tensorEstimation.E;
elseif isfield(tensorEstimation, 'eigenvector1')
    V = tensorEstimation.eigenvector1;
else
    V = tensorEstimation.EV1;
end

TH = tensorEstimation.TH;

% if isfield(tensorEstimation, 'spacingUnit')
%     spacing = tensorEstimation.spacing .* tensorEstimation.spacingUnit ;
% else
%     spacing = tensorEstimation.spacing;
% end

if isfield(tensorEstimation, 'spacing')
    spacing = tensorEstimation.spacing;
else
    spacing = [1 1 1]';
end

if nargin == 2
    
    sth = sum(TH(:));
    s = size(TH);
    points = zeros(sth, 3);
    vectors = zeros(sth, 3);
    counter = 0;
    for s1 = 1:s(1)
        for s2 = 1:s(2)
            for s3 = 1:s(3)
                if TH(s1, s2, s3) == true
                    counter = counter+1;

                    points(counter, :) = [s1, s2, s3] .* spacing';
                    
                    vectors(counter, :) = V(:, s1, s2, s3)';

                end
            end
        end
    end

    save(fileName, 'points', 'vectors', '-v7');

elseif nargin == 3
    
    s = size(TH);
    
    tempSliceTH = TH(:,:, sliceId);
    sth = sum(tempSliceTH(:));
    points = zeros(sth, 3);
    vectors = zeros(sth, 3);
    counter = 0;
    
    for s1 = 1:sel:s(1)
        for s2 = 1:sel:s(2)
            for s3 = sliceId
                if TH(s1, s2, s3) == true
                    counter = counter+1;

                    points(counter, :) = [s1, s2, s3] .* spacing';
                    
                    vectors(counter, :) = V(:, s1, s2, s3)';

                end
            end
        end
    end

    save(fileName, 'points', 'vectors', '-v7');

end
