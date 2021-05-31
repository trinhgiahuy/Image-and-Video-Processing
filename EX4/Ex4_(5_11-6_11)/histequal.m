% Find the probability of each frequency ( NUM of thatt pixel appear / no
% of pixel
% Find the cumulative histogram of each freq
% E.g : Cumulative hist of 1 is freq(1)
% Then cumulative hist of 2 = cumulative of 1  + freq(2)  = 5
% Find the cumulative distribution probapility of each pixel
% = cumulative hist of that pixel / no of pixel
% Round off ( Final value by multiplying cdf with no of bins
% Replace image with final value of each pixel

function HIm= histequal(Im)
    HIm = zeros(size(Im,1),size(Im,2),'uint8');
    freq=zeros(256,1);
    probf=zeros(256,1); %Probability of each pixel
    probc=zeros(256,1); %Probality of cumulative hist
    cum=zeros(256,1);
    output=zeros(256,1);
    %freq counts the occurrence of each pixel value.
    %The probability of each occurrence is calculated by probf.
    numofpixels = size(Im,1)*size(Im,2);
    for i=1:size(Im,1)
        for j=1:size(Im,2)
            value=Im(i,j);
            freq(value+1)=freq(value+1)+1;
            probf(value+1)=freq(value+1)/numofpixels;
        end
    end
    sum=0;
    no_bins=255;

    %The cumulative distribution probability is calculated. 
    for i=1:size(probf)
       sum=sum+freq(i);
       cum(i)=sum;
       probc(i)=cum(i)/numofpixels;
       output(i)=round(probc(i)*no_bins);
    end

    for i=1:size(Im,1)
        for j=1:size(Im,2)
            HIm(i,j)=output(Im(i,j)+1);
        end
    end
%HIm
end

