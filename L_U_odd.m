function AdjacentElements = L_U_odd(i,j)
%L_U_OLD ���н����Ų�������������ż����Ԫ��[i,j]���ھ�
%   i x����
%   j y����
%   ����ֵ��˳������
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

