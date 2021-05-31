function count =  non_zero(S)
% count = 0;
% 
% for j=1:4
%     for k=1:4
%         if S(j,k)==1
%             count = count +1;
%         end
%     end
% end

indices = S ~=0;
count = sum(indices(:));

end
