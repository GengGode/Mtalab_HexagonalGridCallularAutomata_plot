% A[X,Y] 中心坐标
% L 边长
% m 行数
% n 列数
% gcf 窗口句柄
% RGB 填充颜色 0 Black 1 White
% HL 紧邻方式 0 行紧邻 1列紧邻
% HW 奇偶行突出 0 奇数行突出 1 偶数行突出
A=[0 0];
L=0.3;
HW=0;
gcf=1;
HL=0;
m=4;
n=5;
RGB=[0.5 0 0];
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

if length(A)==2
    X_L=0:L:L*(m-1);
    Y_L=0:L:L*(n-1);
    X=A(1)+X_L;
    Y=A(2)+Y_L;
    %             X=X_L(i);
    %             Y=Y_L(j);
    t = linspace(0,2*pi,7);
    tic
    for i=1:m
        for j=1:i
    switch HL
        case 0
            x =L*sin(t)+Ro3.*(X(:)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(m+HW);%7*m 1:m
            y =L*cos(t)+Y(:).*3/2;%n*7
            
    end
        end
    end
    toc
    x
    y;
    y=y';%7*n
    repmat(x,1,n)
            x=repmat(x,1,n)'%(m*n)*7
            Y=repmat(y,1,m);%7*(n*m)
            X=reshape(x,7,m*n)%7*(m*n)
    tic
    line(X,Y)
    toc
    try
        Color=RGB;
        for i=1:m
            for j=1:m
        %RGB(i,j,:)=[(sin(i/10)+cos(j/8)+2)/4 0 (cos(j/8-4.6)+sin(i/10)+2)/4];
        %fill(x{i},y{j},RGB)
            end
        end
    catch
        fill(x,y,[1,1,1])%出错显示为红色
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