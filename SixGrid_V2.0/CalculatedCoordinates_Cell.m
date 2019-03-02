function [X Y] = CalculatedCoordinates_Cell(m,n,L,X0,Y0,HL,HW)
%CALCULATEDCOORDINATES_CELL ���������������и��������ζ�������
%   [X,Y] = CalculatedCoordinates_Cell(int m,int n,double L,double X0,double Y0,logical HL,logical HW)
%   Input:
%   m ����
%   n ����
%   L �߳�
%   X0 ����X����
%   Y0 ����Y����
%   HL ���ڷ�ʽ 0 �н��� 1�н���
%   HW ��ż��ͻ�� 0 ������ͻ�� 1 ż����ͻ��
%   Output��
%   [X,Y] = {[7,m*n],[7,m*n]}
%   ����ֵΪ�������󣬷ֱ�����m*n�������εĶ���X��Y����

%   GengGode_2019.03.02
%   SixGird_V2.0

if nargin<2 %�����������ʱʹ��Ĭ�ϲ��������������쳣��ʹ����ֹͣ
    m=3;
    n=3;
    L=1;
    X0=0;
    Y0=0;
    HL=0;
    HW=0;
    disp("CalculatedCoordinates_Cell function Input Error!")
    disp("����������㣡")
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

Ro3=sqrt(3);%Ԥ����3��ƽ����
x=cell(m,n);%Ԥ��������е������ζ����X
y=cell(m,n);%Ԥ��������е������ζ����X
t = [0 pi/3 2*pi/3 pi 4*pi/3 5*pi/3 2*pi;
    pi/6 pi/2 5*pi/6 7*pi/6 3*pi/2 11*pi/6 0];
%Ԥ������������ζ���ĽǶȲ���

X_L=0:L:L*(m-1);%�������е����������ĵ�X
Y_L=0:L:L*(n-1);%�������е����������ĵ�Y

%disp("XY:")
%tic

switch HL
    %����i�С���j��Ԫ�صĶ���������x��y����x��yԪ����{i,j}
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
% X_T=[x{:}];%XԪ������
% Y_T=[y{:}];%YԪ������
% X=reshape(X_T,7,length(X_T)/7);%ʹ�����ų�7�У�����ÿһ�ж���һ�������ε����ж����X����
% Y=reshape(Y_T,7,length(Y_T)/7);%ʹ�����ų�7�У�����ÿһ�ж���һ�������ε����ж����Y����


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

