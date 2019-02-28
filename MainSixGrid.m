clc;clear;
Handle=figure('Position',[300 200 600 400],'NumberTitle','off','name','Six Grid');
gcf=Handle.Number;
L=1;%单元格边长
HL=0;%紧邻方式
HW=0;%突出方式
xy=[0,0];%左下角坐标
lamda=20;

CellData=rand(lamda,lamda);
CellDataTemp=CellData;

for i=1:lamda
    for j=1:lamda
        if CellData(i,j)>=0.9
            CellData(i,j)=1;%Cell is life
        else
            CellData(i,j)=0;%Cell is Die
        end
    end
end

tic

m=size(CellData,1);
n=size(CellData,2);

plotSixGrid(xy,L,m,n,CellData,gcf,HL,HW)

toc
for key=1:100
    pause(0.5);
    for i=1:lamda
        for j=1:lamda
            NeiIJ=U_ij(i,j,HL);
            CellState=0;
            for k=1:6
                p=NeiIJ{k}(1);
                q=NeiIJ{k}(2);
                if p ~= 0 && p<=lamda && q~=0 && q<=lamda
                    CellState=CellState+CellData(p,q);
                end
            end
            
            if CellState<2
                CellDataTemp(i,j)=0;
            elseif CellState>2
                CellDataTemp(i,j)=0;
            else
                CellDataTemp(i,j)=1;
            end
            
        end
    end
    plotSixGrid(xy,L,m,n,CellDataTemp,gcf,HL,HW)
    CellData=CellDataTemp;
end