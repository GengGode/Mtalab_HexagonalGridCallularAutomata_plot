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
W=2; % 线框宽度
Ro3=1.732050807568877;% sqrt(3);
t=[0, 1.047197551196598, 2.094395102393195, ...
    3.141592653589793, 4.188790204786391,...
    5.235987755982989, 6.283185307179586]; % linespace(0,2*pi,7);

% 原点坐标存在
if length(A)==2
    % 网格平铺
    X_L=A(1)+(0:L:L*m);
    Y_L=A(2)+(0:L:L*n);
    % 遍历
    for i=1:m
        for j=1:n
            X=X_L(i);
            Y=Y_L(j);
            % 根据网格类型，将平铺坐标映射为六边形网格坐标
            switch HL
                case 0
                    x = L*sin(t)+Ro3*(X-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW);
                    y = L*cos(t)+Y*3/2;
                case 1
                    % 旋转30°
                    t=t+1.047197551196598;
                    x = L*sin(t)+X*3/2;
                    y = L*cos(t)+Ro3*(Y-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(i+HW);
                otherwise
                    x = L*sin(t)+Ro3*(X-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW);
                    y = L*cos(t)+Y*3/2;
            end
            % 绘制六边形线框
            % 在大规模绘图中可能会增加计算开销
            % plot(x,y,'c','Linewidth',W);
            % 填充颜色
            try
                Color=RGB(i,j);
                % Color=[(sin(i/10)+cos(j/8)+2)/4 0 (cos(j/8-4.6)+sin(i/10)+2)/4]
                % 填充函数开销异常巨大，尽量小规模测试
                fill(x,y,[Color Color Color])
            catch
                fill(x,y,[1,0,0])% 异常将显示为红色
            end
            
        end
    end
end

end

