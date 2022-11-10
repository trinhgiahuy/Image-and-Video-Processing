% Histrogram specification:
% http://fourier.eng.hmc.edu/e161/lectures/contrast_transform/node3.html

% Histogram matching is concerned with transforming one image's histogram so
% that it looks like another. 
% Apply this mapping on the first imageto get it to look like the intensity distribution 
% of the second image

% Compute the hist of each im individually.w
% Compute their cdf(cumulative distribution function) for each image
% Denote cdf1 : intensity x for the first image.
% Idea of mapping : cdf1(g1) = cdf2(g2).
% Find the smallest absolute difference btw cdf1 of each intensity of img
% 1% ( denote g1)and image 2 
% abs(min(cdf1(g1)-cdf2(g2)))
% Every entity g1 we find intensity g2 such :
% M(g1) = arg min[g2 in [0,255]] |cdf1(g1)-cdf2(g2)| with all g1 in [0,255]

function out = histmatch(imA,imB)
    M = zeros(256,1,'uint8'); %// Store mapping - Cast to uint8 to respect data type
    histA = imhist(imA); %// Compute histograms
    histB = imhist(imB);
    
    % B = cumsum(A) returns the cumulative sum of A starting
    % at the beginning of the first array dimension in A whose size does not equal 1.
    
    % n = numel(A) returns the number of elements, n, in array A, 
    % equivalent to prod(size(A)).
    cdf1 = cumsum(histA) / numel(imA); %// Compute CDFs
    cdf2 = cumsum(histB) / numel(imB);

    %// Compute the mapping
    for idx = 1 : 256
        [~,ind] = min(abs(cdf1(idx) - cdf2));
        M(idx) = ind-1;
        % Subtract as the data type spans from [0,255].
    end

    %// Now apply the mapping to get first image to make
    %// the image look like the distribution of the second image
    out = M(double(imA)+1); %Mapping M 
    % The intensity range of im1 spans between [0,255], but MATLAB's indexing for arrays starts at 1.
    % add 1 to every value of imA so we can properly index into M to produce our output
end

