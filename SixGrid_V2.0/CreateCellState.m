function [CellData,CellState] = CreateCellState(m,n,SurvalRate)
%CREATECELLSTATE 创建元胞空间矩阵，并随机化初始状态
%   CellData = CreateCellState(int m,int n,int SurvalRate)
%   Input:
%   m 行数
%   n 列数
%   SurvalRate 生成率 0 - 1
%   Output:
%   CellData 返回元胞空间矩阵

%   GengGode_2019.03.03
%   SixGird_V2.1

CellDataTemp=rand(m,n);
CellDataTemp(CellDataTemp<SurvalRate)=1;%小于出生率的生存
CellDataTemp(CellDataTemp<1)=0;%其他的死亡
CellData=logical(CellDataTemp);%逻辑化数组
CellState=CellData;

end

