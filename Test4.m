clc;clear;
lamda=20;%空间大小 
rande=0.1;%随机出生率 0 - 1
Generation=100;%目标演化步数
CellData=rand(lamda,lamda);%随机出生
CellData(CellData<rande)=1;%小于出生率的生存
CellData(CellData<1)=0;%其他的死亡
CellDataTemp=CellData+1;%缓存数组
StateCell=zeros(lamda,lamda);
StateCell(abs(CellData-CellDataTemp)>0)=1