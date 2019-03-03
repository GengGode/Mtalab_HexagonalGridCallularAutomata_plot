function [CellData,CellState] = ChangeCellState(CellData,CellState)
%CHANGECELLSTATE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

[Value_x,Value_y]=size(CellData);
CellDataTemp=CellData;
AdjacentElementsState=false(6,1);
AdjacentElement={[0 0];[0 0];[0 0];[0 0];[0 0];[0 0]};
x=0;
y=0;
for i=1:Value_x
    for j=1:Value_y
        AdjacentElement=AdjacentElements(i,j);%�õ���ǰλ��Ԫ�ص��ھ�����
        for k=1:6
            x=AdjacentElement{k}(1);%�ھӵ�X
            y=AdjacentElement{k}(2);%�ھӵ�Y
            if x~= 0 && x<=Value_x && y~=0 && y<=Value_y %��ֹ�ھӳ����߽�
                AdjacentElementsState(k)=CellDataTemp(x,y);%�õ��ھ�״̬
            else
                %
                AdjacentElementsState(k)=0;
                %
            end
        end
        CellData(i,j)=EvolutionRules(AdjacentElementsState);%�ж���һʱ�̸�Ԫ��״̬
        CellState(abs(CellData-CellDataTemp)>0)=1;%�Ա��ж�Ԫ���Ƿ����ı�
    end
end
end

