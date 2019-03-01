clc;clear;
Handle=figure('Position',[300 200 600 400],'NumberTitle','off','name','Six Grid');
gcf=Handle.Number;
L=1;%单元格边长
HL=0;%紧邻方式
HW=0;%突出方式
xy=[0,0];%左下角坐标

lamda=20;%空间大小 
rande=0.1;%随机出生率 0 - 1
Generation=100;%目标演化步数

B=2;%生存状态邻居数
S=2;%死亡状态邻居数

%创建空间数组
%初始化元胞
CellData=rand(lamda,lamda);%随机出生
CellData(CellData<rande)=1;%小于出生率的生存
CellData(CellData<1)=0;%其他的死亡
CellDataTemp=CellData;%缓存数组

%显示并计时
tic
% m=size(CellData,1);
% n=size(CellData,2);
%显示为窗口
%imshow(CellDataTemp)
plotSixGrid(xy,L,lamda,lamda,CellData,gcf,HL,HW)
toc

%开始演化
for key=1:100
   % pause(0.5);
    for i=1:lamda
        for j=1:lamda
            NeiIJ=U_ij(i,j,HL);
            CellState=[0 0 0 0 0 0];
            for k=1:6
                p=NeiIJ{k}(1);
                q=NeiIJ{k}(2);
                if p ~= 0 && p<=lamda && q~=0 && q<=lamda
                    CellState(k)=CellData(p,q);
                end
            end
            CellDataTemp(i,j)=EvolutionRules(B,S,CellState);
        end
    end
    %imshow(CellDataTemp)
    plotSixGrid(xy,L,lamda,lamda,CellDataTemp,gcf,HL,HW)
    CellData=CellDataTemp;
end