function [X,Y] = CalculatedCoordinates_Cell(m,n,L,X0,Y0,HL,HW)
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

%   GengGode_2019.03.03
%   SixGird_V2.1

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
% x=cell(m,n);%预定义的所有的六边形顶点的X
% y=cell(m,n);%预定义的所有的六边形顶点的X
t = [0 pi/3 2*pi/3 pi 4*pi/3 5*pi/3 2*pi;
    pi/6 pi/2 5*pi/6 7*pi/6 3*pi/2 11*pi/6 pi/6];
%预定义计算六边形顶点的角度参数

X_L=0:L:L*(m-1);%创建所有的六边形中心的X
Y_L=0:L:L*(n-1);%创建所有的六边形中心的Y

if HL
    x = L*sin(t(HL+1,:))+X_L(:)*1.5;
    y = L*cos(t(HL+1,:))+(Y_L(:)-1)*Ro3;
else
    x = L*sin(t(HL+1,:))+(X_L(:)-1)*Ro3;
    y = L*cos(t(HL+1,:))+Y_L(:)*1.5;
end

x=(x+X0)';
y=(y+Y0)';

x=repmat(x,n,1);
Y_T=repmat(y,1,m);
X_T=reshape(x,7,m*n);

[X_Add,Y_Add]=XY_Add(m,n,L,HL,HW);

X=X_T+X_Add;
Y=Y_T+Y_Add;

%line(X,Y,'Color','black','MarkerEdgeColor','y')

end

function [X_Add,Y_Add]=XY_Add(m,n,L,HL,HW)
%XY_ADD 计算六边形网格中错位偏移值
%   [X_Add,Y_Add]=XY_Add(int m,int n,double L,logical HL,logical HW)
%   Input:
%   m 行数
%   n 列数
%   L 边长
%   HL 紧邻方式 0 行紧邻 1列紧邻
%   HW 奇偶行突出 0 奇数行突出 1 偶数行突出
%   Output：
%   [X_Add,Y_Add] = {[7,m*n],[7,m*n]}
%   返回值为两个矩阵，分别描述m*n个六边形顶点X、Y坐标的错位偏移值

%   GengGode_2019.03.03
%   SixGird_V2.0

Ro3=sqrt(3);
Value_1=L*Ro3*0.75;
Value_2=L*Ro3*0.25;
Value=zeros(1,7)+Value_1;
if HL
    %X_ADD
    X_Add=0;
    %Y_ADD
    if HW
        %HW=1
        y_t1=Value+Value_2;
        y_t2=Value-Value_2;
    else
        %HW=0
        y_t1=Value-Value_2;
        y_t2=Value+Value_2;
    end
    y_t1=repmat(y_t1,n,1);
    y_t2=repmat(y_t2,n,1);
    y_t=[y_t1;y_t2];
    if mod(m,2)==0
        Y_Add=repmat(y_t,m/2,1)';
    else
        Y_Add=repmat(y_t,(m-1)/2,1)';
        Y_Add=[Y_Add y_t1'];
    end
    
else
    %X_ADD
    if HW
        %HW=1
        x_t1=Value+Value_2;
        x_t2=Value-Value_2;
    else
        %HW=0
        x_t1=Value-Value_2;
        x_t2=Value+Value_2;
    end
    x_t=[x_t1;x_t2];
    if mod(n,2)==0
        xl=repmat(x_t,n/2,1)';
        if mod(n,2)==0
            X_Add=repmat(xl,1,m);
        else
            X_Add=repmat(xl,1,m-1);
            X_Add=[X_Add xl];
        end
    else
        xl=repmat(x_t,(n-1)/2,1)';
        xl=[xl x_t1'];
        if mod(m,2)==0
            X_Add=repmat(xl,1,m);
        else
            X_Add=repmat(xl,1,m-1);
            X_Add=[X_Add xl];
        end
    end
    %Y_ADD
    Y_Add=0;
end
end

