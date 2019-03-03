function [CellData,CellState] = CreateCellState(m,n,SurvalRate)
%CREATECELLSTATE ����Ԫ���ռ���󣬲��������ʼ״̬
%   CellData = CreateCellState(int m,int n,int SurvalRate)
%   Input:
%   m ����
%   n ����
%   SurvalRate ������ 0 - 1
%   Output:
%   CellData ����Ԫ���ռ����

%   GengGode_2019.03.03
%   SixGird_V2.1

CellDataTemp=rand(m,n);
CellDataTemp(CellDataTemp<SurvalRate)=1;%С�ڳ����ʵ�����
CellDataTemp(CellDataTemp<1)=0;%����������
CellData=logical(CellDataTemp);%�߼�������
CellState=CellData;

end

