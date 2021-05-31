function im_cube = sliceCube(im,dist)
    P_old = impixel(im);
    im = double(im);
    im_cube = zeros(size(im));
    [row col] = size(P_old);
    im_red = im(:,:,1);
    im_gre = im(:,:,2);
    im_blu = im(:,:,3);
    %[im_row im_col] = size(im);
    if row == 1
        P = P_old;
    else
        % In case P is a matrix size Mx3
        P_new = ones(size(P_old));
        col1 = sum(P_old(:,1))/row;
        col2 = sum(P_old(:,2))/row;
        col3 = sum(P_old(:,3))/row;
        P_new(1,1) = col1;
        P_new(1,2) = col2;
        P_new(1,3) = col3;
        P = P_new;
    end
    
    for i = 1:size(im,1)
        for j = 1:size(im,2)    
            cmask = abs(im_red(i,j)-P(1,1))+abs(im_blu(i,j)-P(1,2))+abs(im_gre(i,j)-P(1,3));
            if cmask <= dist
                im_cube(i,j, :)=im(i,j, :);
            end
        end
    end          
    
    im_cube = (uint8(im_cube));
end

