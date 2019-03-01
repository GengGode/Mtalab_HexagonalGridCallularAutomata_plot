clc;clear;
Handle=figure('Position',[300 200 600 400],'NumberTitle','off','name','Six Grid');
gcf=Handle.Number;
L=1;%��Ԫ��߳�
HL=0;%���ڷ�ʽ
HW=0;%ͻ����ʽ
xy=[0,0];%���½�����

lamda=20;%�ռ��С 
rande=0.1;%��������� 0 - 1
Generation=100;%Ŀ���ݻ�����

B=2;%����״̬�ھ���
S=2;%����״̬�ھ���

%�����ռ�����
%��ʼ��Ԫ��
CellData=rand(lamda,lamda);%�������
CellData(CellData<rande)=1;%С�ڳ����ʵ�����
CellData(CellData<1)=0;%����������
CellDataTemp=CellData;%��������

%��ʾ����ʱ
tic
% m=size(CellData,1);
% n=size(CellData,2);
%��ʾΪ����
%imshow(CellDataTemp)
plotSixGrid(xy,L,lamda,lamda,CellData,gcf,HL,HW)
toc

%��ʼ�ݻ�
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