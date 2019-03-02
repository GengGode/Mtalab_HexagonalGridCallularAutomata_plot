function [X Y] = CalculatedCoordinates_Cell(m,n,L,X0,Y0,HL,HW)
%CALCULATEDCOORDINATES_CELL 计算六边形网格中各个六边形顶点坐标
%   [X,Y] = CalculatedCoordinates_Cell(int m,int n,double L,double X0,double Y0,logical HL,logical HW)
%   Input:
%   m 行数
%   n 列数
%   L 边长
%   X0 中心X坐标
%   Y0 中心Y坐标
%   HL 紧邻方式 0 行紧邻 1列紧邻
%   HW 奇偶行突出 0 奇数行突出 1 偶数行突出
%   Output：
%   [X,Y] = {[7,m*n],[7,m*n]}
%   返回值为两个矩阵，分别描述m*n个六边形的顶点X、Y坐标

%   GengGode_2019.03.02
%   SixGird_V2.0

if nargin<2 %输入参数不足时使用默认参数，以免引起异常而使程序停止
    m=3;
    n=3;
    L=1;
    X0=0;
    Y0=0;
    HL=0;
    HW=0;
    disp("CalculatedCoordinates_Cell function Input Error!")
    disp("输入参数不足！")
elseif nargin<3
    L=1;
    X0=0;
    Y0=0;
    HL=0;
    HW=0;
elseif nargin<5
    X0=0;
    Y0=0;
    HL=0;
    HW=0;
elseif nargin<6
    HL=0;
    HW=0;
elseif nargin<7
    HW=0;
end

Ro3=sqrt(3);%预定义3的平方根
x=cell(m,n);%预定义的所有的六边形顶点的X
y=cell(m,n);%预定义的所有的六边形顶点的X
t = [0 pi/3 2*pi/3 pi 4*pi/3 5*pi/3 2*pi;
    pi/6 pi/2 5*pi/6 7*pi/6 3*pi/2 11*pi/6 0];
%预定义计算六边形顶点的角度参数

X_L=0:L:L*(m-1);%创建所有的六边形中心的X
Y_L=0:L:L*(n-1);%创建所有的六边形中心的Y

%disp("XY:")
%tic

switch HL
    %将第i行、第j列元素的顶点坐标下x、y赋予x、y元胞的{i,j}
    case 0
        x = L*sin(t(HL+1,:))+Ro3*(X_L(:)-1);
        y = L*cos(t(HL+1,:))+Y_L(:)*3/2;
        
        x_t1=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW+1);
        x_t2=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW);
        x_t=[x_t1;x_t2];
        if mod(m,2)==0
            xt=repmat(x_t,n*m/2,1)';
        else 
            xt=repmat(x_t,(n*m-1)/2,1)';
            xt=[xt x_t1'];
        end
        yt=0;
    case 1
        x = L*sin(t(HL+1,:))+X_L(:)*3/2;
        y = L*cos(t(HL+1,:))+Ro3*(Y_L(:)-1);
        xt=0;
        y_t1=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW);
        y_t2=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW+1);
        y_t1=repmat(y_t1,n,1);
        y_t2=repmat(y_t2,n,1);
        y_t=[y_t1;y_t2];
        if mod(m*n,2)==0
            yt=repmat(y_t,m/2,1)';
        else 
            yt=repmat(y_t,(m-1)/2,1)';
            yt=[yt y_t1'];
        end
        
end

% X_T=x'
% Y_T=y'
% X=reshape(X_T,7,length(X_T)/7);%m
% Y=reshape(Y_T,7,length(Y_T)/7);%n
x=(x+X0)';
y=(y+Y0)';%7
% 
% X_T=[x{:}];%X元胞矩阵化
% Y_T=[y{:}];%Y元胞矩阵化
% X=reshape(X_T,7,length(X_T)/7);%使矩阵排成7行，其中每一列都是一个六边形的所有顶点的X坐标
% Y=reshape(Y_T,7,length(Y_T)/7);%使矩阵排成7行，其中每一列都是一个六边形的所有顶点的Y坐标


x=repmat(x,n,1);%(m*n)*7
Y=repmat(y,1,m)+yt;%7
X=reshape(x,7,m*n)+xt;%7


toc
% tic
figure(gcf)
hold on
line(X,Y,'Color','black','MarkerEdgeColor','y')
% toc
% tic
for i=1:m*n
   %pause(1)
fill(X(:,i),Y(:,i),[1 0 0])
end

