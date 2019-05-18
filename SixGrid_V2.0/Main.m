% 启动脚本
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
%左下角对应左上角
%右下角对应右上角
%右上角对应右上角
%左上角对应左下角
%上下颠倒对应 行列反转
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