function PatchSixGrid()
%PatchSixGrid 使用Patch函数绘制六边形网格
Dot=[0,0.866;0.5,1.732;1.5,1.732;2,0.866;1.5,0;0.5,0];%基本六边形顶点，边长为1
tic
for i=1:100 %通过位移形成六边形网格
    for j=1:100
        patch(Dot(:,1)+3*i, Dot(:,2)+1.732*j, 'white'),hold on
        patch(Dot(:,1)+1.5+3*i, Dot(:,2)+0.8660+1.732*j, 'white'),hold on
    end
end
toc