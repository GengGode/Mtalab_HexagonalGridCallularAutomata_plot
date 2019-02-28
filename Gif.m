function Gif(gcf,pic_num,name)

%Gif 根据句柄抓取图像生成GIF
% gcf:绘图区句柄
% pic_num:GIF帧控制函数
% name:GIF文件名，包含文件格式，例如'test.gif'

I=frame2im(getframe(gcf));
[I,map]=rgb2ind(I,256);
if pic_num == 1
    imwrite(I,map,name,'gif', 'Loopcount',inf,'DelayTime',0.2);
else
    imwrite(I,map,name,'gif','WriteMode','append','DelayTime',0.2);
end
end
