clc;clear;
L=1;
inta=5;
m=inta;
n=inta;
HW=0;
HL=1;
A=[5 4];
% x=cell(m,n);
% y=cell(m,n);
Ro3=sqrt(3);
t = linspace(0,2*pi,7);
X_L=0:L:L*(m-1);
Y_L=0:L:L*(n-1);
tic
switch HL
    case 0
        x = L*sin(t)+Ro3*(X_L(:)-1);
        y = L*cos(t)+Y_L(:)*3/2;
        x_t1=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW+1);
        x_t2=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW);
        x_t=[x_t1;x_t2];
        xt=repmat(x_t,floor((n*m)/2),1)';
        yt=0;
    case 1
        t=t+pi/6;
        x = L*sin(t)+X_L(:)*3/2;
        y = L*cos(t)+Ro3*(Y_L(:)-1);
        xt=0;
        y_t1=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW);
        y_t2=zeros(1,7)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(HL+HW+1);
        y_t1=repmat(y_t1,n,1);
        y_t2=repmat(y_t2,n,1);
        y_t=[y_t1;y_t2];
        yt=repmat(y_t,floor((m)/2),1)';
        
end
%%
% X_T=x'
% Y_T=y'
% X=reshape(X_T,7,length(X_T)/7);%m
% Y=reshape(Y_T,7,length(Y_T)/7);%n
x=(x+A(1))';
y=(y+A(2))';%7


%%
x=repmat(x,n,1);%(m*n)*7
Y=repmat(y,1,m)+yt;%7
X=reshape(x,7,m*n)+xt;%7
%%
toc
% tic
figure(gcf)
hold on
line(X,Y,'Color','black','MarkerEdgeColor','y')
% toc
% tic
for i=1:m*n
   pause(1)
fill(X(:,i),Y(:,i),[1 0 0])
end
% toc
hold off