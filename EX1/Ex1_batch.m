
function Ex1_batch
for k = 1:6
    %sample = num2str(imread("c_{i}.jpg"));
    image_name = Process(imread(['c_' num2str(k) '.jpg']));
    imwrite(image_name,['c_' num2str(k) '.bmp'],'bmp');
end
%I is arraycells

