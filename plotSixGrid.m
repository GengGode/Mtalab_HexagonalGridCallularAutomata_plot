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
W=2; % �߿���
Ro3=1.732050807568877;% sqrt(3);
t=[0, 1.047197551196598, 2.094395102393195, ...
    3.141592653589793, 4.188790204786391,...
    5.235987755982989, 6.283185307179586]; % linespace(0,2*pi,7);

% ԭ���������
if length(A)==2
    % ����ƽ��
    X_L=A(1)+(0:L:L*m);
    Y_L=A(2)+(0:L:L*n);
    % ����
    for i=1:m
        for j=1:n
            X=X_L(i);
            Y=Y_L(j);
            % �����������ͣ���ƽ������ӳ��Ϊ��������������
            switch HL
                case 0
                    x = L*sin(t)+Ro3*(X-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW);
                    y = L*cos(t)+Y*3/2;
                case 1
                    % ��ת30��
                    t=t+1.047197551196598;
                    x = L*sin(t)+X*3/2;
                    y = L*cos(t)+Ro3*(Y-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(i+HW);
                otherwise
                    x = L*sin(t)+Ro3*(X-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW);
                    y = L*cos(t)+Y*3/2;
            end
            % �����������߿�
            % �ڴ��ģ��ͼ�п��ܻ����Ӽ��㿪��
            % plot(x,y,'c','Linewidth',W);
            % �����ɫ
            try
                Color=RGB(i,j);
                % Color=[(sin(i/10)+cos(j/8)+2)/4 0 (cos(j/8-4.6)+sin(i/10)+2)/4]
                % ��亯�������쳣�޴󣬾���С��ģ����
                fill(x,y,[Color Color Color])
            catch
                fill(x,y,[1,0,0])% �쳣����ʾΪ��ɫ
            end
            
        end
    end
end

end

