function State = EvolutionRules(B,S,AdjacentElements)
%EVOLUTIONRULES 判断下一周期元素的状态
%   B 生存线
%   S 死亡线
%   AdjacentElements 邻居状态

K=sum(AdjacentElements);
if K>=B&&K<=S
    State=1;
else
    State=0;
end
end

