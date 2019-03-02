function AdjacentElements = U_ij(i,j,HW,HL)
%U_IJ 根据紧邻排布方式确定六方网格中元素[i,j]的邻居
%   i x坐标
%   j y坐标
% HL 紧邻方式 0 行紧邻 1列紧邻

WL=[num2str(HW) num2str(HL)];
switch WL
    case '00'
        if mod(j,2)==0
            AdjacentElements=H_U_odd(i,j);
        else
            AdjacentElements=H_U_even(i,j);
        end
    case '10'
        if mod(i,2)==0
            AdjacentElements=L_U_odd(i,j);
        else
            AdjacentElements=L_U_even(i,j);
        end
    case '01'
        if mod(j,2)~=0
            AdjacentElements=H_U_odd(i,j);
        else
            AdjacentElements=H_U_even(i,j);
        end
    case '11'
        if mod(i,2)~=0
            AdjacentElements=L_U_odd(i,j);
        else
            AdjacentElements=L_U_even(i,j);
        end
end
end

