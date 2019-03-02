function AdjacentElements = AdjacentElements(i,j,HL,HW)
%ADJACENTELEMENTS ���ݽ����Ų���ʽȷ������������Ԫ��[i,j]���ھ�
%   AdjacentElements = AdjacentElements(double i,double j,logical HW,logical HL)
%   Input��
%   i x����
%   j y����
%   HL ���ڷ�ʽ 0 �н��� 1�н���
%   HW ��ż��ͻ�� 0 ������ͻ�� 1 ż����ͻ��
%   Output��
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   ����ֵΪ�������������Ԫ�����飬ÿ����������һ�����������ڵ������ε���������

%   GengGode_2019.03.02
%   SixGird_V2.0

if nargin<2 %�����������ʱʹ��Ĭ�ϲ��������������쳣��ʹ����ֹͣ
    i=0;
    j=0;
    HL=0;
    HW=0;
    disp("AdjacentElements function Input Error!")
    disp("����������㣡")
elseif nargin==2 
    HL=0;
    HW=0;
elseif nargin==3
    HW=0;
end
    
WL = HL*10+HW;%�����������ϲ��ж�

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
%H_U_OLD ���н����Ų�������������������Ԫ��[i,j]���ھ�
%   Input��
%   i x����
%   j y����
%   Output��
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   ����ֵΪ�������������Ԫ�����飬ÿ����������һ�����������ڵ������ε���������
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
%H_U_OLD ���н����Ų�������������ż����Ԫ��[i,j]���ھ�
%   Input��
%   i x����
%   j y����
%   Output��
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   ����ֵΪ�������������Ԫ�����飬ÿ����������һ�����������ڵ������ε���������
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
%H_U_OLD ���н����Ų�������������������Ԫ��[i,j]���ھ�
%   Input��
%   i x����
%   j y����
%   Output��
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   ����ֵΪ�������������Ԫ�����飬ÿ����������һ�����������ڵ������ε���������
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
%L_U_OLD ���н����Ų�������������ż����Ԫ��[i,j]���ھ�
%   Input��
%   i x����
%   j y����
%   Output��
%   AdjacentElements = {[x1 y1],[x2 y2],[x3 y3],[x4 y4],[x5 y5],[x6 y6]}
%   ����ֵΪ�������������Ԫ�����飬ÿ����������һ�����������ڵ������ε���������
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

