
%   用平均滤波器平滑原始图像得到的模糊图像
%   平均滤波器的大小： 15乘15
%   Function calling by giving the size of matrix(row and column) of mean
%   filter matrix

function Fuzzy_Matrix = MeanFilter(MeanFilter_Row, MeanFilter_Column)
    %   read information from source picture
    Source_Matrix = imread('C:\Users\sophannapel\Desktop\my school\大三第二学期\数字图像处理\Lab\test4\f5.tif');
    subplot(1,2,1), imshow(Source_Matrix, []), title('Original Image'), whitebg('black')
    
    %   平均滤波器的生成
    MeanFilter_Matrix = zeros(MeanFilter_Row, MeanFilter_Column);
    After_MeanFilter_Matrix = Source_Matrix;
    %   Row and Column of source picture matrix
    [Row, Column] = size(Source_Matrix); %  row and column of source picture matrix
    tempMatrix = zeros(MeanFilter_Row, MeanFilter_Column);
    
    Flag_Column = 0;
    for OutColumn  = 1:Column-MeanFilter_Column
        Flag_Column = Flag_Column + 1;
        if Flag_Column == 1 %   location to replace with new average value
            midColumn = round(((OutColumn  + MeanFilter_Column-1)/2));
        else 
            midColumn = midColumn + 1;
        end
       
        Flag_Row = 0;
        for OutRow = 1:Row-MeanFilter_Row
            % 边缘处理
            % 边缘的第一列处理只取四个元素来进行求平均值
            if OutColumn  == 1      
                temp = sum(After_MeanFilter_Matrix(OutRow:OutRow+MeanFilter_Row,OutColumn :OutColumn+1));
                After_MeanFilter_Matrix(OutRow,OutColumn) = round(sum(temp)/(MeanFilter_Row*2));
            end
            % 边缘的第一行处理只取六个元素来进行求平均值
            if  OutColumn  >=2 && OutRow == 1
                temp = sum(After_MeanFilter_Matrix(OutRow:OutRow+MeanFilter_Row,OutColumn-1:OutColumn+1));
                After_MeanFilter_Matrix(OutRow,OutColumn) = round(sum(temp)/(MeanFilter_Row*3));
            end 
            % 边缘以外的处理
            for SubRow = OutRow:OutRow+MeanFilter_Row
               %   each time take MeanFilter_Row and MeanFilter_Column
                %   size from Source picture
                tempMatrix = After_MeanFilter_Matrix(OutRow : OutRow+MeanFilter_Row-1 , OutColumn   : OutColumn  +MeanFilter_Column-1);
            end
            
           Flag_Row =  Flag_Row + 1;
           if  Flag_Row == 1
                midRow = round(((OutRow + MeanFilter_Row-1)/2));
           else
               midRow = midRow + 1;
           end
  
            tempElement = floor((sum(sum(tempMatrix)))/(MeanFilter_Row * MeanFilter_Column));
            After_MeanFilter_Matrix(midRow, midColumn) = tempElement;   %   replace middle location with new average value
            tempElement = 0;
            tempMatrix(1:MeanFilter_Row, MeanFilter_Column) = 0;
        end
    end

   temp = sum(After_MeanFilter_Matrix(OutRow:OutRow+MeanFilter_Row,OutColumn :OutColumn+1));
   After_MeanFilter_Matrix(OutRow,OutColumn) = round(sum(temp)/(MeanFilter_Row*2));
   %边缘的最后一行
   temp = sum(After_MeanFilter_Matrix(OutRow-MeanFilter_Row:OutRow,OutColumn-1:OutColumn+1));
   After_MeanFilter_Matrix(OutRow,OutColumn) = round(sum(temp)/(MeanFilter_Row*3));
                
    subplot(1,2,2), imshow(After_MeanFilter_Matrix); title('Median Filter Image')
    Fuzzy_Matrix = After_MeanFilter_Matrix;
end

