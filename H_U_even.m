function AdjacentElements = H_U_even(i,j)
%H_U_OLD 以行紧邻排布的六方网格中奇数行元素[i,j]的邻居
%   i x坐标
%   j y坐标
%   返回值按顺序排列
%      -2-[i-1,j+1]-2-    -3-[i,j+1]-3-
%   -1-[i-1,j]-1-    -[i,j]-   -4-[i+1,j]-4-
%      -6-[i-1,j-1]-6-    -5-[i,j-1]-5-

AdjacentElements = {
    [i-1,j]
    [i-1,j+1]
    [i,j+1]
    [i+1,j]
    [i,j-1]
    [i-1,j-1]
    };

end

