function [CellData,CellState] = ChangeCellState(CellData,CellState)
%CHANGECELLSTATE 此处显示有关此函数的摘要
%   此处显示详细说明

[Value_x,Value_y]=size(CellData);
CellDataTemp=CellData;
AdjacentElementsState=false(6,1);
AdjacentElement={[0 0];[0 0];[0 0];[0 0];[0 0];[0 0]};
x=0;
y=0;
for i=1:Value_x
    for j=1:Value_y
        AdjacentElement=AdjacentElements(i,j);%得到当前位置元素的邻居坐标
        for k=1:6
            x=AdjacentElement{k}(1);%邻居的X
            y=AdjacentElement{k}(2);%邻居的Y
            if x~= 0 && x<=Value_x && y~=0 && y<=Value_y %防止邻居超出边界
                AdjacentElementsState(k)=CellDataTemp(x,y);%得到邻居状态
            else
                %
                AdjacentElementsState(k)=0;
                %
            end
        end
        CellData(i,j)=EvolutionRules(AdjacentElementsState);%判断下一时刻该元素状态
        CellState(abs(CellData-CellDataTemp)>0)=1;%对比判断元素是否发生改变
    end
end
end

