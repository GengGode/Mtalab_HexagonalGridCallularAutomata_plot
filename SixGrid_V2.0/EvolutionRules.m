function State = EvolutionRules(AdjacentElementsState,B,S)
%EVOLUTIONRULES 判断下一周期元素的状态
%   State = EvolutionRules(B,S,AdjacentElements)
%   Input：
%   AdjacentElements 当前元素的邻居状态
%   B 由死而生时邻居数
%   S 由生而死时邻居数
%   Output：
%   State 返回值为下一时刻元素状态

%   GengGode_2019.03.02
%   SixGird_V2.0

if nargin<2 %输入参数不足时使用默认参数，以免引起异常而使程序停止
    B=2;
    S=3;
elseif nargin<3
    S=3;
end

%规则
K=sum(AdjacentElementsState);

if K>=B && K<=S
    State=1;
else
    State=0;
end

end

