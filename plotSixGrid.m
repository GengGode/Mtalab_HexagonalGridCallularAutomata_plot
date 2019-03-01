function plotSixGrid(A,L,m,n,RGB,gcf,HL,HW)
%PLOTSIXGRID ��������������
% A[X,Y] ��������
% L �߳�
% m ����
% n ����
% gcf ���ھ��
% RGB �����ɫ 0 Black 1 White
% HL ���ڷ�ʽ 0 �н��� 1�н���
% HW ��ż��ͻ�� 0 ������ͻ�� 1 ż����ͻ��

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
t = linspace(0,2*pi,7);
x=cell(1,m);
if length(A)==2
    X_L=0:L:L*(m-1);
    Y_L=0:L:L*(n-1);
    for i=1:m
        for j=1:n
            switch HL
                case 0
                    x{i} = L*sin(t)+Ro3*(X_L(i)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW)+A(1);
                    y{j} = L*cos(t)+Y_L(j)*3/2+A(2);
                case 1
                    t=t+pi/6;
                    x = L*sin(t)+X_L(i)*3/2+A(1);
                    y = L*cos(t)+Ro3*(Y_L(j)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(i+HW)+A(2);
                    t=t-pi/6;
                otherwise
                    x = L*sin(t)+Ro3*(X_L(i)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW)+A(1);
                    y = L*cos(t)+Y_L(j)*3/2+A(2);
            end
        end
    end
    X_T=[x{:}];
    Y_T=[y{:}];
    x=reshape(X_T,length(X_T)/7,7)
    y=reshape(Y_T,length(Y_T)/7,7)'
    %x=x';
    %y=y';%7*n
    x=repmat(x,n,1)';%(m*n)*7
    Y=repmat(y,1,m);%7*(n*m)
    X=reshape(x,7,m*n);%7*(m*n)
    
    line(X,Y)
    
    try
        Color=RGB(i,j);
        %                 if Color>=1
        %                     fill(x,y,[0 0 0])
        %                 end
        %RGB(i,j,:)=[(sin(i/10)+cos(j/8)+2)/4 0 (cos(j/8-4.6)+sin(i/10)+2)/4];
        fill(x,y,[Color Color Color])
        
    catch
        fill(x,y,[1,1,1])%������ʾΪ��ɫ
    end
    
end

end

