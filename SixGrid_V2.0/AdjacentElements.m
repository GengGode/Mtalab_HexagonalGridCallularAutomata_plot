function AdjacentElements = AdjacentElements(i,j,HL,HW)
%ADJACENTELEMENTS 根据紧邻排布方式确定六方网格中元素[i,j]的邻居
%   AdjacentElements = AdjacentElements(double i,double j,logical HW,logical HL)
%   Input：
%   i x坐标
%   j y坐标
%   HL 紧邻方式 0 行紧邻 1列紧邻
%   HW 奇偶行突出 0 奇数行突出 1 偶数行突出
%   Output：
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   返回值为含有六个矩阵的元胞数组，每个矩阵描述一个与输入相邻的六边形的中心坐标

%   GengGode_2019.03.02
%   SixGird_V2.0

if nargin<2 %输入参数不足时使用默认参数，以免引起异常而使程序停止
    i=0;
    j=0;
    HL=0;
    HW=0;
    disp("AdjacentElements function Input Error!")
    disp("输入参数不足！")
elseif nargin==2 
    HL=0;
    HW=0;
elseif nargin==3
    HW=0;
end
    
WL = HL*10+HW;%将两个参数合并判断

switch WL
    case 0
        if mod(j,2) == 0
            AdjacentElements = H_U_odd(i,j);
        else
            AdjacentElements=H_U_even(i,j);
        end
    case 10
        if mod(i,2)==0
            AdjacentElements=L_U_odd(i,j);
        else
            AdjacentElements=L_U_even(i,j);
        end
    case 1
        if mod(j,2)~=0
            AdjacentElements=H_U_odd(i,j);
        else
            AdjacentElements=H_U_even(i,j);
        end
    case 11
        if mod(i,2)~=0
            AdjacentElements=L_U_odd(i,j);
        else
            AdjacentElements=L_U_even(i,j);
        end
end
end

function AdjacentElements = H_U_even(i,j)
%H_U_OLD 以行紧邻排布的六方网格中奇数行元素[i,j]的邻居
%   Input：
%   i x坐标
%   j y坐标
%   Output：
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   返回值为含有六个矩阵的元胞数组，每个矩阵描述一个与输入相邻的六边形的中心坐标
%      -2-[i-1,j+1]-2-    -3-[i,j+1]-3-
%   -1-[i-1,j]-1-    -[i,j]-   -4-[i+1,j]-4-
%      -6-[i-1,j-1]-6-    -5-[i,j-1]-5-

%   GengGode_2019.03.02
%   SixGird_V2.0

AdjacentElements = {
    [i-1,j]
    [i-1,j+1]
    [i,j+1]
    [i+1,j]
    [i,j-1]
    [i-1,j-1]
    };

end

function AdjacentElements = H_U_odd(i,j)
%H_U_OLD 以行紧邻排布的六方网格中偶数行元素[i,j]的邻居
%   Input：
%   i x坐标
%   j y坐标
%   Output：
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   返回值为含有六个矩阵的元胞数组，每个矩阵描述一个与输入相邻的六边形的中心坐标
%      -2-[i,j+1]-2-    -3-[i+1,j+1]-3-
%   -1-[i-1,j]-1-    -[i,j]-   -4-[i+1,j]-4-
%      -6-[i,j-1]-6-    -5-[i+1,j-1]-5-

%   GengGode_2019.03.02
%   SixGird_V2.0

AdjacentElements = {
    [i-1,j]
    [i,j+1]
    [i+1,j+1]
    [i+1,j]
    [i+1,j-1]
    [i,j-1]
    };

end

function AdjacentElements = L_U_even(i,j)
%H_U_OLD 以行紧邻排布的六方网格中奇数行元素[i,j]的邻居
%   Input：
%   i x坐标
%   j y坐标
%   Output：
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   返回值为含有六个矩阵的元胞数组，每个矩阵描述一个与输入相邻的六边形的中心坐标
%               -2-[i+1,j]-2-    
%   -1-[i+1,j-1]-1-         -3-[i+1,j+1]-3-
%                   -[i,j]-   
%   -6-[i,j-1]-6-           -4-[i,j+1]-4-
%               -5-[i-1,j]-5-

%   GengGode_2019.03.02
%   SixGird_V2.0

AdjacentElements = {
    [i-1,j]
    [i,j+1]
    [i+1,j]
    [i+1,j-1]
    [i,j-1]
    [i-1,j-1]
    };

end

function AdjacentElements = L_U_odd(i,j)
%L_U_OLD 以列紧邻排布的六方网格中偶数行元素[i,j]的邻居
%   Input：
%   i x坐标
%   j y坐标
%   Output：
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   返回值为含有六个矩阵的元胞数组，每个矩阵描述一个与输入相邻的六边形的中心坐标
%               -2-[i,j+1]-2-    
%   -1-[i-1,j+1]-1-         -3-[j+1,i+1]-3-
%                   -[i,j]-   
%   -6-[i-1,j]-6-           -4-[i+1,j]-4-
%               -5-[i,j-1]-5-

%   GengGode_2019.03.02
%   SixGird_V2.0

AdjacentElements = {
    [i-1,j+1]
    [i,j+1]
    [i+1,j+1]
    [i+1,j]
    [i,j-1]
    [i-1,j]
    };

end

