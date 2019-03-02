clc;clear;
Handle=figure('Position',[300 200 600 400],'NumberTitle','off','name','Six Grid');
gcf=Handle.Number;%窗口句柄

L=1;%单元格边长
HL=0;%紧邻方式
HW=0;%突出方式
xy=[0,2];%左下角坐标

lamda=30;%空间大小 
rande=0.1;%随机出生率 0 - 1
Generation=100;%目标演化步数

B=2;%生存状态邻居数
S=3;%死亡状态邻居数

%创建空间数组，初始化元胞
CellData=rand(lamda,lamda);%随机出生
CellData(CellData<rande)=1;%小于出生率的生存
CellData(CellData<1)=0;%其他的死亡
CellDataTemp=CellData;%缓存数组
StateCell=ones(lamda,lamda);%状态转化 0 状态不变 1 状态改变
AnyCellState=[0 0 0 0 0 0];%元素的邻居状态 0 死亡 1 存活
%显示并计时
tic
%显示为image
%imshow(CellDataTemp)
plotSixGrid(xy,L,lamda,lamda,CellData,StateCell,gcf,HL,HW)
toc

%开始演化
for key=1:100
   % pause(0.5);
    for i=1:lamda
        for j=1:lamda
            NeiIJ=AdjacentElements(i,j,HW,HL);%得到当前位置元素的邻居坐标
            for k=1:6
                
                p=NeiIJ{k}(1);%邻居的X
                q=NeiIJ{k}(2);%邻居的Y
                
                if p ~= 0 && p<=lamda && q~=0 && q<=lamda%防止邻居超出边界
                    AnyCellState(k)=CellData(p,q);%得到邻居状态
                end
            end
            CellDataTemp(i,j)=EvolutionRules(B,S,AnyCellState);%判断下一时刻该元素状态
        end
    end
    StateCell(abs(CellData-CellDataTemp)>0)=1;%对比判断元素是否发生改变
    %imshow(CellDataTemp)
    plotSixGrid(xy,L,lamda,lamda,CellDataTemp,StateCell,gcf,HL,HW)%重绘
    CellData=CellDataTemp;%将下一时刻的状态置为开始状态，等待再次进入循环
end