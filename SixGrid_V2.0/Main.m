% �����ű�
clc;
clear;
a=50;
b=50;
[CellData,CellState]=CreateCellState(b,a,0.1);
% CellData=[
%    0 0 0 0 0 0
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
%���µߵ���Ӧ ���з�ת
[X,Y]=CalculatedCoordinates_Cell(a,b);
figure(1)
imshow(CellData)
%gcf=Drawing_Line(X,Y);
%Drawing_Patch(X,Y,CellData,CellState,gcf);
for i=1:100
    tic
    [CellData,CellState] = ChangeCellState(CellData,CellState);
    hold on
    imshow(CellData)
    %Drawing_Line(X,Y,gcf);
    %Drawing_Patch(X,Y,CellData,CellState,gcf);
    %Gif(gcf,i,'test4.gif');
    toc
end