function AdjacentElements = L_U_even(i,j)
%H_U_OLD ���н����Ų�������������������Ԫ��[i,j]���ھ�
%   i x����
%   j y����
%   ����ֵ��˳������
%               -2-[i+1,j]-2-    
%   -1-[i+1,j-1]-1-         -3-[i+1,j+1]-3-
%                   -[i,j]-   
%   -6-[i,j-1]-6-           -4-[i,j+1]-4-
%               -5-[i-1,j]-5-
%

AdjacentElements = {
    [i-1,j]
    [i,j+1]
    [i+1,j]
    [i+1,j-1]
    [i,j-1]
    [i-1,j-1]
    };

end

