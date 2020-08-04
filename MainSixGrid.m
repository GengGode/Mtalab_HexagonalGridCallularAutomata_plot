% 主程序入口
clc;clear;

gcf=figure('Position',[300 200 600 500],'NumberTitle','off','name','Six Grid');

L=1;% 单元格边长
HL=0;% 紧邻方式 //平顶或者尖顶
HW=0;% 突出方式 //首行（列）的第一个格子是否比第二行（列）的第一个格子更高
xy=[0,0];% 左下角坐标

lamda=10;% 空间大小 
rande=0.1;% 随机出生率 0 - 1
Generation=100;% 目标演化步数

% 通过更改EvolutionRules()函数的内容可以自定义更新规则
B=2;% 生存状态邻居数
S=3;% 死亡状态邻居数

% 创建并初始化空间数组
CellData=rand(lamda,lamda);% 随机出生
CellData(CellData<rande)=1;% 小于出生率的生存
CellData(CellData<1)=0;% 其他的死亡
CellDataTemp=CellData;% 缓存数组

% 显示绘图计时
tic
% 显示
plotSixGrid(xy,L,lamda,lamda,CellData,gcf,HL,HW)
toc

% 开始演化
for key=1:100
    % 每秒两帧 1 / 0.5 = 2 fps
    pause(0.5);
    
    tic
    % 遍历每个格子
    for i=1:lamda
        for j=1:lamda
            % 通过网格的类型以及格子的坐标获得其邻居的坐标
            NeiIJ=U_ij(i,j,HL);
            % 临时变量 用来储存六个邻居的状态 初始化为零
            CellState=[0 0 0 0 0 0];
            % 遍历六个邻居的坐标获取其状态并储存
            for k=1:6
                p=NeiIJ{k}(1);
                q=NeiIJ{k}(2);
                % 判断坐标是否越界 如果越界则其状态为零（因初始化时赋值为零）
                if p ~= 0 && p<=lamda && q~=0 && q<=lamda
                    CellState(k)=CellData(p,q);
                end
            end
            % 根据邻居状态以及BS条件来判断下一步当前格子的状态，置入缓存数组
            CellDataTemp(i,j)=EvolutionRules(B,S,CellState);
        end
    end
    % 根据状态数组绘制六边形网格
    try
        plotSixGrid(xy,L,lamda,lamda,CellDataTemp,gcf,HL,HW)
    catch
        disp("窗口已关闭，停止运行");
        break;
    end
    % 将状态数组更新为缓存数组的内容
    CellData=CellDataTemp;
    toc
    
end
disp("运行已结束");