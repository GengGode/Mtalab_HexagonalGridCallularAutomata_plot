function AdjacentElements = U_ij(i,j,HW,HL)
%U_IJ ���ݽ����Ų���ʽȷ������������Ԫ��[i,j]���ھ�
%   i x����
%   j y����
% HL ���ڷ�ʽ 0 �н��� 1�н���

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

