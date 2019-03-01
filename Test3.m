clc;clear;
L=1;
inta=10;
m=inta;
n=inta;
HW=0;
HL=0;
A=[5 4];
x=cell(m,n);
y=cell(m,n);
Ro3=sqrt(3);
t = linspace(0,2*pi,7);
X_L=0:L:L*(m-1);
Y_L=0:L:L*(n-1);
tic
for i=1:m
    for j=1:n
        x{i,j} = L*sin(t)+Ro3*(X_L(i)-1)+L*Ro3*3/4+L*Ro3*1/4*(-1)^(j+HW)+A(1);
        y{i,j} = L*cos(t)+Y_L(j)*3/2+A(2);
    end
end
X_T=[x{:}];
Y_T=[y{:}];
X=reshape(X_T,7,length(X_T)/7);%m
Y=reshape(Y_T,7,length(Y_T)/7);%n
% x=x';
% %y=y'%7
% x=repmat(x,1,n);%(m*n)*7
% Y=repmat(y,1,m);%7
% X=reshape(x',7,m*n);%7
toc
tic
figure(gcf)
hold on
line(X,Y,'Color','black','MarkerEdgeColor','y')
toc
tic
for i=1:m*n
    pause(0.1)
fill(X(:,i),Y(:,i),[1 0 0])
end
toc
hold off