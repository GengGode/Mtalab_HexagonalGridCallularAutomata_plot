function State = EvolutionRules(AdjacentElementsState,B,S)
%EVOLUTIONRULES �ж���һ����Ԫ�ص�״̬
%   State = EvolutionRules(B,S,AdjacentElements)
%   Input��
%   AdjacentElements ��ǰԪ�ص��ھ�״̬
%   B ��������ʱ�ھ���
%   S ��������ʱ�ھ���
%   Output��
%   State ����ֵΪ��һʱ��Ԫ��״̬

%   GengGode_2019.03.02
%   SixGird_V2.0

if nargin<2 %�����������ʱʹ��Ĭ�ϲ��������������쳣��ʹ����ֹͣ
    B=2;
    S=3;
elseif nargin<3
    S=3;
end

%����
K=sum(AdjacentElementsState);

if K>=B && K<=S
    State=1;
else
    State=0;
end

end

