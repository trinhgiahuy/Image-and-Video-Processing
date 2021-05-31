function im_contrast_stretch = ContrastStretch(im)
    im = double(im);
    im_contrast_stretch = (im(:) - min(im(:))) / (max(im(:)) - min(im(:)));
    im_contrast_stretch = min(1, max(im_contrast_stretch, 0));
    im_contrast_stretch = cast(im_contrast_stretch * 255, 'uint8');
    im_contrast_stretch = reshape(im_contrast_stretch, size(im));
end

% function new_block = donw_samp(block)
% [m,n,~]= size(block);
% for k=1:m
%     for g=1:n
%         mode = block(2,2);
%         block(k,g) = mode;
%     end
% end
% 
% new_block = block;
% 
% end