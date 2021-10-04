function [im_0deg, im_45deg, im_90deg, im_135deg] = directional_filtering(im_gray, filter_size)
    filters = zeros(filter_size, filter_size, 4);
    
    % 0 degree directional filter.
    filters((filter_size + 1)/2, :, 1) = ones(1, filter_size);
    
    % 90 degree directional filter.
    filters(:, :, 3) = filters(:, :, 1)';
    
    % 135 degree directional filter.
    filters(:, :, 4) = eye(filter_size);
    
    % 45 degree directional filter.
    filters(:, :, 2) = fliplr(filters(:, :, 4));
    
    % Make sum of all elements in each filter equal to 1.
    filters = filters ./ sum(filters, [1, 2]);
    
    im_0deg = uint8(imfilter(im_gray, filters(:, :, 1)));
    im_45deg = uint8(imfilter(im_gray, filters(:, :, 2)));
    im_90deg = uint8(imfilter(im_gray, filters(:, :, 3)));
    im_135deg = uint8(imfilter(im_gray, filters(:, :, 4)));
end