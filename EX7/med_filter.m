function im_med_filtered = med_filter(im, filter_size)
    pad_side = (filter_size - 1)/2;
    %create an image with padding surround
    im_pad_minus_one = zeros(size(im, 1) + 2 * pad_side, size(im, 2) + 2 * pad_side);
    im_pad_minus_one((pad_side + 1):(pad_side + size(im, 1)), ...
    (pad_side + 1):(pad_side + size(im, 2))) = im;
    
    im_med_filtered = uint8(zeros(size(im)));
   
    for i = (pad_side + 1):(pad_side + size(im, 1))
       for j = (pad_side + 1):(pad_side + size(im, 2))
            value_focus = im_pad_minus_one((i - pad_side):(i + pad_side), ...
                (j - pad_side):(j + pad_side));
            
            %indices = find(value_focus ~= -1);
            %value_focus = value_focus(indices);
            
            im_med_filtered(i - pad_side, j - pad_side) = median(value_focus(:));
       end
    end
end


