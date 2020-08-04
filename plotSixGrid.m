function plotSixGrid(A,L,m,n,RGB,gcf,HL,HW)
%PLOTSIXGRID 绘制六边形网格
% A[X,Y] 中心坐标
% L 边长
% m 行数
% n 列数
% gcf 窗口句柄
% RGB 填充颜色 0 Black 1 White
% HL 紧邻方式 0 行紧邻 1列紧邻
% HW 奇偶行突出 0 奇数行突出 1 偶数行突出

if HW>0
    HW=1;
else
    HW=0;
end
%排除错误输入
if HL>0
    HL=1;
else
    HL=0;
end
%排除错误输入

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
                fill(x,y,[1,1,1])%出错显示为红色
            end
            
        end
    end
end

end

