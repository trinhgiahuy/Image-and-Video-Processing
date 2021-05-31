function I4 = Process(I)
    I1 = imresize(I, 3/4);
    [m,n,~] = size(I1);
    I2 = I1(:,n/2:end,:);
    I3 = fliplr(I2);
    %I1(:,1:floor(n/2),:) = I3;
    I4 = imrotate(I3,90);        %rotate umage 90 degree counter clockwise
end

