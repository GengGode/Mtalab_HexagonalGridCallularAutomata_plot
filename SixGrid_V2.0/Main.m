% Æô¶¯½Å±¾
clc;
clear;
a=200
[CellData,CellState]=CreateCellState(a,a,0.1);
[X,Y]=CalculatedCoordinates_Cell(a,a);
%Drawing_Line(X,Y,1);
Drawing_Patch(X,Y,CellData,CellState,1);
for i=1:100
    tic
    [CellData,CellState] = ChangeCellState(CellData,CellState);
    Drawing_Patch(X,Y,CellData,CellState,1);
    toc
end