function saveTensorSlices4mayavi(fileName, data, sliceList)
% save tensor volumn or slices
% 
% saveTensor4mayavi(fileName, data)
% saveTensor4mayavi(fileName, data, sliceList)
% 
% sliceList = [24 25 27 ],  

scale = 10000;
% scale = 1000000;
% scale = 1;
data.T = data.T * scale;

s = size(data.TH);

switch nargin
    case 2

        sth = sum(data.TH(:));

        points = zeros(sth, 3);
        tensors = zeros(sth, 3, 3);
        scal
        counter = 0;
        for s1 = 1:s(1)
            for s2 = 1:s(2)
                for s3 = 1:s(3)
                    if data.TH(s1, s2, s3) == true

                        counter = counter+1;

                        points(counter, :) = [s1, s2, s3];
                        tensors(counter, :, :) = data.T(:, :, s1, s2, s3)';

                    end
                end
            end
        end

    case 3
        
        % tempTH = data.TH(:,:, sliceId-sliceRange : sliceId+sliceRange);
        tempTH = data.TH(:,:, sliceList);
        sth = sum(tempTH(:));

        points = zeros(sth, 3);
        tensors = zeros(sth, 3, 3);
        ev = zeros(sth, 3);
        
        counter = 0;
        for s1 = 1:s(1)
            for s2 = 1:s(2)
                for s3 = sliceList %sliceId-sliceRange : sliceId+sliceRange
                    if data.TH(s1, s2, s3) == true

                        counter = counter+1;

                        points(counter, :) = [s1, s2, s3];
                        tensors(counter, :, :) = data.T(:, :, s1, s2, s3)';
                        ev(counter, :) = data.EV1(:,s1,s2,s3)';
                        
                        
                    end
                end
            end
        end
        
end

% for coloring tensors with scalars 
choose = 0;
switch choose 
    case 0
    
        % s = sqrt(sv(:, 1).^2 + sv(:, 2).^2 /256 + sv(:, 3).^2 / 65536);
        %scalars = ev(:, 1)* 65536 + ev(:, 2)*256  + ev(:, 3) ;
        
        % bad
        %scalars = ev(:, 1)*1 + ev(:, 2)*2  + ev(:, 3)*4;
        
        % too much yellow
        % scalars = ev(:, 1).^2*1 + ev(:, 2).^2*2  + ev(:, 3).^2*4;
        
        % strange symetric
        % scalars = abs(ev(:, 1))*1 + abs(ev(:, 2))*2  + abs(ev(:, 3))*3;    
        
        
       %{
        % all seems good 
        
        scalars = ev(:, 1).^2*1 + ev(:, 2).^2*1.000001  + ev(:, 3).^2*1.000004;        
        
        scalars = ev(:, 1).^2*1 + ev(:, 2).^2*1.5  + ev(:, 3).^2*2;
        scalars = ev(:, 1).^2*2 + ev(:, 2).^2*2.5  + ev(:, 3).^2*3;
        scalars = ev(:, 1).^2*2 + ev(:, 2).^2*2.01  + ev(:, 3).^2*2.02;
        
        %}
        
        % good engough
        scalars = ev(:, 1).^2*1 + ev(:, 2).^2*2  + ev(:, 3).^2*3;
 
        
        %{
        % bad
    case 1
    
        ev256 = uint8((ev + ones(size(ev)))*128);
        scalars = sum(ev256, 2);

    case 2

        temp_xy3 = shiftdim(data.EV1(:,:,:,s3), 1);
        temp_xy3_uint = uint8( (temp_xy3 + ones(size(temp_xy3)))*128);
        temp_xy_ind = rgb2ind(temp_xy3_uint, 256);
        scalars = temp_xy_ind(data.TH(:,:,s3) == 1);
        
        %}
        
end

% make the scalars in [0, 1]
scalars = scalars - min(scalars);
scalars = scalars/max(scalars);

save(fileName, 'tensors', 'points', 'scalars', '-v7');
