function State = EvolutionRules(B,S,AdjacentElements)
%EVOLUTIONRULES �ж���һ����Ԫ�ص�״̬
%   B ������
%   S ������
%   AdjacentElements �ھ�״̬

K=sum(AdjacentElements);
if K>=B&&K<=S
    State=1;
else
    State=0;
end
end

