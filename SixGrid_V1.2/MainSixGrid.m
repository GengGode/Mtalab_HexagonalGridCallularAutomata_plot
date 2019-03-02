clc;clear;
Handle=figure('Position',[300 200 600 400],'NumberTitle','off','name','Six Grid');
gcf=Handle.Number;%���ھ��

L=1;%��Ԫ��߳�
HL=0;%���ڷ�ʽ
HW=0;%ͻ����ʽ
xy=[0,2];%���½�����

lamda=30;%�ռ��С 
rande=0.1;%��������� 0 - 1
Generation=100;%Ŀ���ݻ�����

B=2;%����״̬�ھ���
S=3;%����״̬�ھ���

%�����ռ����飬��ʼ��Ԫ��
CellData=rand(lamda,lamda);%�������
CellData(CellData<rande)=1;%С�ڳ����ʵ�����
CellData(CellData<1)=0;%����������
CellDataTemp=CellData;%��������
StateCell=ones(lamda,lamda);%״̬ת�� 0 ״̬���� 1 ״̬�ı�
AnyCellState=[0 0 0 0 0 0];%Ԫ�ص��ھ�״̬ 0 ���� 1 ���
%��ʾ����ʱ
tic
%��ʾΪimage
%imshow(CellDataTemp)
plotSixGrid(xy,L,lamda,lamda,CellData,StateCell,gcf,HL,HW)
toc

%��ʼ�ݻ�
for key=1:100
   % pause(0.5);
    for i=1:lamda
        for j=1:lamda
            NeiIJ=AdjacentElements(i,j,HW,HL);%�õ���ǰλ��Ԫ�ص��ھ�����
            for k=1:6
                
                p=NeiIJ{k}(1);%�ھӵ�X
                q=NeiIJ{k}(2);%�ھӵ�Y
                
                if p ~= 0 && p<=lamda && q~=0 && q<=lamda%��ֹ�ھӳ����߽�
                    AnyCellState(k)=CellData(p,q);%�õ��ھ�״̬
                end
            end
            CellDataTemp(i,j)=EvolutionRules(B,S,AnyCellState);%�ж���һʱ�̸�Ԫ��״̬
        end
    end
    StateCell(abs(CellData-CellDataTemp)>0)=1;%�Ա��ж�Ԫ���Ƿ����ı�
    %imshow(CellDataTemp)
    plotSixGrid(xy,L,lamda,lamda,CellDataTemp,StateCell,gcf,HL,HW)%�ػ�
    CellData=CellDataTemp;%����һʱ�̵�״̬��Ϊ��ʼ״̬���ȴ��ٴν���ѭ��
end