% A[X,Y] ��������
% L �߳�
% m ����
% n ����
% gcf ���ھ��
% RGB �����ɫ 0 Black 1 White
% HL ���ڷ�ʽ 0 �н��� 1�н���
% HW ��ż��ͻ�� 0 ������ͻ�� 1 ż����ͻ��
A=[0 0];
L=0.3;
HW=0;
gcf=1;
HL=0;
m=1000;
n=1000;
RGB=[0.5 0 0]
if HW>0
    HW=1;
else
    HW=0;
end
%�ų���������
if HL>0
    HL=1;
else
    HL=0;
end
%�ų���������

figure(gcf)
hold on
Ro3=sqrt(3);

if length(A)==2
    X_L=0:L:L*m;
    Y_L=0:L:L*n;
    X=A(1)+X_L;
    Y=A(2)+Y_L;
    %             X=X_L(i);
    %             Y=Y_L(j);
    t = linspace(0,2*pi,7);
    switch HL
        case 0
            x = mat2cell(L*sin(t)+Ro3.*(X(:)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(m+HW),ones(1,m+1),7);
            y = mat2cell(L*cos(t)+Y(:).*3/2,ones(1,n+1),7);
        case 1
            t=t+pi/6;
            x = L*sin(t)+X*3/2;
            y = L*cos(t)+Ro3*(Y-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(i+HW);
        otherwise
            x = L*sin(t)+Ro3*(X-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW);
            y = L*cos(t)+Y*3/2;
    end
    for i=1:m
    plot(x{i},y{i})
    end
    
    try
        Color=RGB;
        for i=1:m
        %RGB(i,j,:)=[(sin(i/10)+cos(j/8)+2)/4 0 (cos(j/8-4.6)+sin(i/10)+2)/4];
        fill(x{i},y{i},Color)
        end
    catch
        fill(x,y,[1,1,1])%������ʾΪ��ɫ
    end
%     a=[0 3 6 9 0 2 4 6 7 6  8 7 6 4 2 4 8 ]
% b=[1 4 7 112 41 70 7 05 5 4 8 8 8 7 9 7]
% t = linspace(0,2*pi,7);
% x=mat2cell(sin(t)+a(:),ones(1,length()),[7])
% y=mat2cell(cos(t)+b(:),[1 1 1 1],[7])
% for i=1:4
%     hold on
% plot(x{i},y{i})
% end
end