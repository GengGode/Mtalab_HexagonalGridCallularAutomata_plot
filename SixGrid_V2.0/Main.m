% �����ű�
clc;
clear;
a=60;
b=60;
[CellData,CellState]=CreateCellState(a,b,0.05);
% CellData=[
%     0 0 0 0 0 0
%     0 0 0 0 0 0
%     0 0 1 0 0 0
%     0 1 0 0 0 0
%     0 0 0 0 0 0
%     0 0 0 0 0 0];
% CellState=CellData;
%���½Ƕ�Ӧ���Ͻ�
%���½Ƕ�Ӧ���Ͻ�
%���ϽǶ�Ӧ���Ͻ�
%���ϽǶ�Ӧ���½�
%���µߵ���Ӧ
[X,Y]=CalculatedCoordinates_Cell(a,b);
gcf=Drawing_Line(X,Y);
Drawing_Patch(X,Y,CellData,CellState,gcf);
for i=1:100
    tic
    [CellData,CellState] = ChangeCellState(CellData,CellState);
    Drawing_Line(X,Y,gcf);
    Drawing_Patch(X,Y,CellData,CellState,gcf);
     Gif(gcf,i,'test4.gif');
    toc
end