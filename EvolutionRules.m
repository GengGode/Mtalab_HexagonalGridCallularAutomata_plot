function State = EvolutionRules(B,S,AdjacentElements)
%EVOLUTIONRULES �ж���һ����Ԫ�ص�״̬
%   B ������
%   S ������
%   AdjacentElements �ھ�״̬

% �����ھ��д����������������������������С��������ʱ����ǰ���Ӵ���������
K=sum(AdjacentElements);
if K>=B&&K<=S
    State=1;
else
    State=0;
end
end

