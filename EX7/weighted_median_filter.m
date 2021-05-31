%%   MANISH KUMAR SHARMA, cdac-noida, 2010

%% weighted median filter on image with salt & pepper noise %%
I = imread('manish.jpg');
I = double(I)
Z = imnoise(I,'salt & pepper',0.02);   % adding Noise
a = double(Z);
b = a;
W = [1,1,1; 1,4,1; 1,1,1]/12    % the values should taken like that, the total sum of values of filter
                                % is divided by there sum and value should be equal to 1.
[row col] = size(a);
for x = 2:1:row-1
    for y = 2:1:col-1
%% To make a 3x3 weighted mask into a 1x9 mask
a1 = [W(1)*a(x-1,y-1) W(2)*a(x-1,y) W(3)*a(x-1,y+1) ...
      W(4)*a(x,y-1) W(5)*a(x,y) W(6)*a(x,y+1)...
      W(7)*a(x+1,y-1) W(8)*a(x+1,y) W(9)*a(x+1,y+1)];
a2 = sort(a1);
med = a2(5); % the 5th value is the weighted median 
b(x,y) = med
    end

end
figure(1); imshow(uint8(Z))
figure(2); imshow(uint8(b))

% implement and pepper and salt nosie manually : 
%https://www.projectrhea.org/rhea/index.php/How_to_Create_Salt_and_Pepper_Noise_in_an_Image