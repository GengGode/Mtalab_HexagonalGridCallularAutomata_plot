function gcf = Drawing_Line(X,Y,gcf)
%DRAWING_LINE 在窗口中绘制六边形网格框架
%   gcf = Drawing_Line(X,Y,gcf)
%   Input：
%   X 
%   Y
%   gcf
%   Output：
%   gcf

%   GengGode_2019.03.03
%   SixGird_V2.0

if nargin<3
    Hander=figure();
    gcf=Hander.Number;
else
    figure(gcf)
end

hold on

line(X,Y,'Color','black')%,'MarkerEdgeColor','y'

set(gcf,'Color','w')
axis off
hold off
end

