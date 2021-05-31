function intensityeq(rgb_im)
    hsv_im = rgb2hsv (rgb_im);
    hsv_hue = hsv_im (:,:,1);
    hsv_sa = hsv_im (:,:,2);
    hsv_v = hsv_im (:,:,3);
    
    
%     subplot(3,2,1)
%     imshow(hsv_hue);title('Hue component')
%     subplot(3,2,2)
%     imshow(histeq(hsv_hue));title('Hue histogram equalization')
    
    
%     subplot(3,2,3)
%     imshow(hsv_sa);title('Saturation component')
%     subplot(3,2,4)
%     imshow(histeq(hsv_sa));title('Saturationn histogram equalization')
    
    
%     subplot(3,2,5)
%     imshow(hsv_v);title('Value component')
%     subplot(3,2,6)
%     imshow(histeq(hsv_v));title('Value histogram equalization')
    
    %result = hsv2rgb(hsv_im);
    result = cat(3,hsv_hue,hsv_sa,histeq(hsv_v));
    %result = hsv2rgb(histeq(hsv_hue)+histeq(hsv_sa)+histeq(hsv_v));
    %result = hsv2rgb(histeq(hsv_hue+hsv_sa+hsv_v));
    result = hsv2rgb(result);
    imshow(result);title('RGB color space image')
end

