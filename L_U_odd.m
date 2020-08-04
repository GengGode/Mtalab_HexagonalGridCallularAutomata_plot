function AdjacentElements = L_U_odd(i,j)
%L_U_OLD 以列紧邻排布的六方网格中偶数行元素[i,j]的邻居
%   i x坐标
%   j y坐标
%   返回值按顺序排列
%               -2-[i,j+1]-2-    
%   -1-[i-1,j+1]-1-         -3-[j+1,i+1]-3-
%                   -[i,j]-   
%   -6-[i-1,j]-6-           -4-[i+1,j]-4-
%               -5-[i,j-1]-5-
%

AdjacentElements = {
    [i-1,j+1]
    [i,j+1]
    [i+1,j+1]
    [i+1,j]
    [i,j-1]
    [i-1,j]
    };

end

