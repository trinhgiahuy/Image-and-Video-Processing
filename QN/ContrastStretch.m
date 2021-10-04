function im_contrast_stretch = ContrastStretch(im)
    im = double(im);
    im_contrast_stretch = (im(:) - min(im(:))) / (max(im(:)) - min(im(:)));
    im_contrast_stretch = min(1, max(im_contrast_stretch, 0));
    im_contrast_stretch = cast(im_contrast_stretch * 255, 'uint8');
    im_contrast_stretch = reshape(im_contrast_stretch, size(im));
end