function AdjacentElements = U_ij(i,j,HL)
%U_IJ ���ݽ����Ų���ʽȷ������������Ԫ��[i,j]���ھ�
%   i x����
%   j y����
% HL ���ڷ�ʽ 0 �н��� 1�н���

switch HL
    case 0
        if mod(j,2)==0
            AdjacentElements=H_U_odd(i,j);
        else
            AdjacentElements=H_U_even(i,j);
        end
    case 1
        if mod(i,2)==0
            AdjacentElements=L_U_odd(i,j);
        else
            AdjacentElements=L_U_even(i,j);
        end
end
end

