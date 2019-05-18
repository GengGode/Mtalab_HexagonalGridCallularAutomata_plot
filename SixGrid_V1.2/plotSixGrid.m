function plotSixGrid(A,L,m,n,RGB,State,gcf,HL,HW)
%PLOTSIXGRID 绘制六边形网格
% A[X,Y] 中心坐标
% L 边长
% m 行数
% n 列数
% gcf 窗口句柄
% RGB 填充颜色 0 Black 1 White
% HL 紧邻方式 0 行紧邻 1列紧邻
% HW 奇偶行突出 0 奇数行突出 1 偶数行突出
% State 状态改变 0 状态不变 1 状态改变

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

Ro3=sqrt(3);

x=cell(m,n);%预定义的所有的六边形顶点的X
y=cell(m,n);%预定义的所有的六边形顶点的X

t = linspace(0,2*pi,7);%预定义计算六边形顶点的角度参数

if length(A)==2
    X_L=0:L:L*(m-1);%创建所有的六边形中心的X
    Y_L=0:L:L*(n-1);%创建所有的六边形中心的Y
    
    %disp("XY:")
    tic
    
    for i=1:m
        for j=1:n
            switch HL
                %将第i行、第j列元素的顶点坐标下x、y赋予x、y元胞的{i,j}
                case 0
                    x{i,j} = L*sin(t)+Ro3*(X_L(i)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW)+A(1);
                    y{i,j} = L*cos(t)+Y_L(j)*3/2+A(2);
                case 1
                    t=t+pi/6;
                    x{i,j} = L*sin(t)+X_L(i)*3/2+A(1);
                    y{i,j} = L*cos(t)+Ro3*(Y_L(j)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(i+HW)+A(2);
                    t=t-pi/6;
                otherwise
                    x{i,j} = L*sin(t)+Ro3*(X_L(i)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW)+A(1);
                    y{i,j} = L*cos(t)+Y_L(j)*3/2+A(2);
            end
        end
    end
    X_T=[x{:}];%X元胞矩阵化
    Y_T=[y{:}];%Y元胞矩阵化
    X=reshape(X_T,7,length(X_T)/7);%使矩阵排成7行，其中每一列都是一个六边形的所有顶点的X坐标
    Y=reshape(Y_T,7,length(Y_T)/7);%使矩阵排成7行，其中每一列都是一个六边形的所有顶点的Y坐标
    
    %line(X,Y,'Color','black')%绘制六边形框架
    
    Color=reshape(RGB,1,m*n);%使颜色矩阵成为一维矩阵，配合按行绘制的六边形框架
    State=reshape(State,1,m*n);%使状态转换矩阵成为一维矩阵，配合按行绘制的六边形框架
    
    toc
    %patch('XData',X(:,:),'YData',Y(:,:),[1 1 1])
    %%
    %disp("Draw:")
    tic
    
    for i=1:m*n%按顺序历遍所有的六边形
        if State(i)==1%判断状态是否发生改变
            %1 发生改变绘制填充六边形
            try
                if Color(i)>=1%判断是否为存活
                    %fill(X(:,i),Y(:,i),[0 0 0])%存活填充黑色
                    patch(X(:,i),Y(:,i),[0 0 0])
                else
                    %fill(X(:,i),Y(:,i),[1 1 1])%死亡填充白色
                    patch(X(:,i),Y(:,i),[1 1 1])
                end
                %RGB(i,j,:)=[(sin(i/10)+cos(j/8)+2)/4 0 (cos(j/8-4.6)+sin(i/10)+2)/4];
                
                %填充所有的六边形
                %fill(X(:,i),Y(:,i),[Color(i) Color(i) Color(i)])
                
            catch
                fill(X(:,i),Y(:,i),[1,0,0])%出错显示为红色
            end
        end
    end
    
    toc
    
end
hold off
end

