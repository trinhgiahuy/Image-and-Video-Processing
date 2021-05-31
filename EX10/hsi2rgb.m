function im_rgb= hsi2rgb(im_hsi)
    H = double(2*pi*im_hsi(:,:,1));
    S = double(im_hsi(:,:,2));
    I = double(im_hsi(:,:,3));
    
    R = zeros(size(im_hsi,[1,2]));
    G = zeros(size(im_hsi,[1,2]));
    B = zeros(size(im_hsi,[1,2]));
    
    indl = H < (2*pi/3);
    R(indl) = I(indl).*(1+S(indl).*cos(H(indl))./cos(pi/3-H(indl)));
    B(indl) = I(indl).*(1-S(indl));
    G(indl) = 3*I(indl)-(R(indl) + B(indl));
    
    ind2 = ((2*pi/3)<=H) & (H<(4*pi/3));
    G(ind2) = I(ind2).*(1+S(ind2).*cos(H(ind2)-(2*pi/3))./cos((pi/3-H(ind2)-H(ind2)-(2*pi/3))));
    R(ind2) = I(ind2).*(1-S(ind2));
    B(ind2) = 3*I(ind2)-(R(ind2) + G(ind2));
    
    ind3 = ((4*pi/3 <=H) & (H<(2*pi)));
    B(ind3) = I(ind3).*(1+S(ind3).*cos(H(ind3)-(4*pi/3))./cos((pi/3-H(ind3)-H(ind3)-(4*pi/3))));
    G(ind3) = I(ind3).*(1-S(ind3));
    R(ind3) = 3*I(ind3)-(G(ind3) + B(ind3));
    
    im_rgb= cat(3,R,G,B);
end


%------------Assistant implement function
% function rgb = hsi2rgb(hsi)
% %HSI2RGB Converts an HSI image to RGB.
% %   RGB = HSI2RGB(HSI) converts an HSI image to RGB, where HSI is
% %   assumed to be of class double with:  
% %     hsi(:, :, 1) = hue image, assumed to be in the range
% %                    [0, 1] by having been divided by 2*pi.
% %     hsi(:, :, 2) = saturation image, in the range [0, 1].
% %     hsi(:, :, 3) = intensity image, in the range [0, 1].
% %
% %   The components of the output image are:
% %     rgb(:, :, 1) = red.
% %     rgb(:, :, 2) = green.
% %     rgb(:, :, 3) = blue.
% 
% %   Copyright 2002-2004 R. C. Gonzalez, R. E. Woods, & S. L. Eddins
% %   Digital Image Processing Using MATLAB, Prentice-Hall, 2004
% %   $Revision: 1.5 $  $Date: 2003/10/13 01:01:06 $
% 
% % Extract the individual HSI component images.
% H = hsi(:, :, 1) * 2 * pi;
% S = hsi(:, :, 2);
% I = hsi(:, :, 3);
% 
% % Implement the conversion equations.
% R = zeros(size(hsi, 1), size(hsi, 2));
% G = zeros(size(hsi, 1), size(hsi, 2));
% B = zeros(size(hsi, 1), size(hsi, 2));
% 
% % RG sector (0 <= H < 2*pi/3).
% idx = find( (0 <= H) & (H < 2*pi/3));
% B(idx) = I(idx) .* (1 - S(idx));
% R(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ ...
%                                           cos(pi/3 - H(idx)));
% G(idx) = 3*I(idx) - (R(idx) + B(idx));
% 
% % BG sector (2*pi/3 <= H < 4*pi/3).
% idx = find( (2*pi/3 <= H) & (H < 4*pi/3) );
% R(idx) = I(idx) .* (1 - S(idx));
% G(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 2*pi/3) ./ ...
%                     cos(pi - H(idx)));
% B(idx) = 3*I(idx) - (R(idx) + G(idx));
% 
% % BR sector.
% idx = find( (4*pi/3 <= H) & (H <= 2*pi));
% G(idx) = I(idx) .* (1 - S(idx));
% B(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 4*pi/3) ./ ...
%                                            cos(5*pi/3 - H(idx)));
% R(idx) = 3*I(idx) - (G(idx) + B(idx));
% 
% % Combine all three results into an RGB image.  Clip to [0, 1] to
% % compensate for floating-point arithmetic rounding effects.
% rgb = cat(3, R, G, B);
% rgb = max(min(rgb, 1), 0);