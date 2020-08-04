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
axis off
Ro3=sqrt(3);

if length(A)==2
    X_L=A(1):L:L*m;
    Y_L=A(2):L:L*n;
    for i=1:m
        for j=1:n
            X=A(1)+X_L(i);
            Y=A(2)+Y_L(j);
            t = linspace(0,2*pi,7);
            switch HL
                case 0
                    x = L*sin(t)+Ro3*(X-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW);
                    y = L*cos(t)+Y*3/2;
                case 1
                    t=t+pi/6;
                    x = L*sin(t)+X*3/2;
                    y = L*cos(t)+Ro3*(Y-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(i+HW);
                otherwise
                    x = L*sin(t)+Ro3*(X-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW);
                    y = L*cos(t)+Y*3/2;
            end
            
            plot(x,y)
            
            try
                Color=RGB(i,j);
                %RGB(i,j,:)=[(sin(i/10)+cos(j/8)+2)/4 0 (cos(j/8-4.6)+sin(i/10)+2)/4];
                fill(x,y,[Color Color Color,])
            catch
                fill(x,y,[1,1,1])%������ʾΪ��ɫ
            end
            
        end
    end
end

end

