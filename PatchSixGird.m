function PatchSixGird(Cell,x,y,gcf)
%PatchSixGrid 使用Patch函数绘制六边形网格
% Cell:元胞状态数组
% (x,y):元胞空间大小
% gcf:绘图区句柄
Dot=[0,0.866;0.5,1.732;1.5,1.732;2,0.866;1.5,0;0.5,0];%基本六边形顶点，边长为1
tic
figure(gcf)
cla reset
for i=1:x%通过位移形成六边形网格
    for j=1:y
        if(1==Cell(i,j))
            
            patch(Dot(:,1)+3*i, Dot(:,2)+1.732*j, 'black');hold on
            patch(Dot(:,1)+1.5+3*i, Dot(:,2)+0.8660+1.732*j, 'black'),hold on
        end
    end
end
toc
end