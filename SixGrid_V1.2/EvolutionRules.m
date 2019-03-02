function State = EvolutionRules(B,S,AdjacentElements)
%EVOLUTIONRULES 判断下一周期元素的状态
%   此处显示详细说明
K=sum(AdjacentElements);
if K>=B&&K<=S
    State=1;
else
    State=0;
end
end

