clc;clear;
lamda=20;%�ռ��С 
rande=0.1;%��������� 0 - 1
Generation=100;%Ŀ���ݻ�����
CellData=rand(lamda,lamda);%�������
CellData(CellData<rande)=1;%С�ڳ����ʵ�����
CellData(CellData<1)=0;%����������
CellDataTemp=CellData+1;%��������
StateCell=zeros(lamda,lamda);
StateCell(abs(CellData-CellDataTemp)>0)=1