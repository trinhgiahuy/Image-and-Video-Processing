function output = med_filter_threshold(im,filter_size,threshold_val)
output = med_filter(im,filter_size);
% abs(output - im)> threshold_val ;
mask = abs(output - im)> threshold_val; 
output(mask) = im(mask);
end

