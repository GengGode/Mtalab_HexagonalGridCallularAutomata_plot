function gcf = Drawing_Patch(X,Y,CellData,CellState,gcf)
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

if nargin<5
    Hander=figure();
    gcf=Hander.Number;
else
    figure(gcf)
end


hold on

Value=numel(CellState);

CellState=reshape(CellState,Value,1);
CellData=reshape(CellData,Value,1);

for i=1:Value
    if  CellState(i)
        if CellData(i)
            patch(X(:,i),Y(:,i),[0 0 0])
        else
            patch(X(:,i),Y(:,i),[1 1 1])
        end
    end


%         if CellData(i)
%                cla reset
%             patch(X(:,i),Y(:,i),[0 0 0])
%         end

end
set(gcf,'Color','w')
axis off
hold off

end

