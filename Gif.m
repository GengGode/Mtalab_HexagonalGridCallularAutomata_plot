function Gif(gcf,pic_num,name)

%Gif ���ݾ��ץȡͼ������GIF
% gcf:��ͼ�����
% pic_num:GIF֡���ƺ���
% name:GIF�ļ����������ļ���ʽ������'test.gif'

I=frame2im(getframe(gcf));
[I,map]=rgb2ind(I,256);
if pic_num == 1
    imwrite(I,map,name,'gif', 'Loopcount',inf,'DelayTime',0.2);
else
    imwrite(I,map,name,'gif','WriteMode','append','DelayTime',0.2);
end
end
