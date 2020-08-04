% ���������
clc;clear;

gcf=figure('Position',[300 200 600 500],'NumberTitle','off','name','Six Grid');

L=1;% ��Ԫ��߳�
HL=0;% ���ڷ�ʽ //ƽ�����߼ⶥ
HW=0;% ͻ����ʽ //���У��У��ĵ�һ�������Ƿ�ȵڶ��У��У��ĵ�һ�����Ӹ���
xy=[0,0];% ���½�����

lamda=10;% �ռ��С 
rande=0.1;% ��������� 0 - 1
Generation=100;% Ŀ���ݻ�����

% ͨ������EvolutionRules()���������ݿ����Զ�����¹���
B=2;% ����״̬�ھ���
S=3;% ����״̬�ھ���

% ��������ʼ���ռ�����
CellData=rand(lamda,lamda);% �������
CellData(CellData<rande)=1;% С�ڳ����ʵ�����
CellData(CellData<1)=0;% ����������
CellDataTemp=CellData;% ��������

% ��ʾ��ͼ��ʱ
tic
% ��ʾ
plotSixGrid(xy,L,lamda,lamda,CellData,gcf,HL,HW)
toc

% ��ʼ�ݻ�
for key=1:100
    % ÿ����֡ 1 / 0.5 = 2 fps
    pause(0.5);
    
    tic
    % ����ÿ������
    for i=1:lamda
        for j=1:lamda
            % ͨ������������Լ����ӵ����������ھӵ�����
            NeiIJ=U_ij(i,j,HL);
            % ��ʱ���� �������������ھӵ�״̬ ��ʼ��Ϊ��
            CellState=[0 0 0 0 0 0];
            % ���������ھӵ������ȡ��״̬������
            for k=1:6
                p=NeiIJ{k}(1);
                q=NeiIJ{k}(2);
                % �ж������Ƿ�Խ�� ���Խ������״̬Ϊ�㣨���ʼ��ʱ��ֵΪ�㣩
                if p ~= 0 && p<=lamda && q~=0 && q<=lamda
                    CellState(k)=CellData(p,q);
                end
            end
            % �����ھ�״̬�Լ�BS�������ж���һ����ǰ���ӵ�״̬�����뻺������
            CellDataTemp(i,j)=EvolutionRules(B,S,CellState);
        end
    end
    % ����״̬�����������������
    try
        plotSixGrid(xy,L,lamda,lamda,CellDataTemp,gcf,HL,HW)
    catch
        disp("�����ѹرգ�ֹͣ����");
        break;
    end
    % ��״̬�������Ϊ�������������
    CellData=CellDataTemp;
    toc
    
end
disp("�����ѽ���");