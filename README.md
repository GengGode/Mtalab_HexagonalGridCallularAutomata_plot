# Mtalab_HexagonalGridCallularAutomata_plot   
基于六边形网格的额六方元胞自动机实现  

### 2020.08.5:  
运行MainSixGrid.m文件即可    
默认随机出生，大小为10x10，演化100步，黑色为死亡，白色为存活，规则为邻居数量大于2且小于3时存活，否则死亡    
有兴趣的话可以通过更改lamda参数来改变地图大小（过大的话需要更长的绘制时间），更改EvolutionRules()函数的内容可以自定义更新规则    
![有边框 Image](https://github.com/GengGode/Mtalab_HexagonalGridCallularAutomata_plot/blob/master/Image/Snipaste_2020-08-05_00-13-49.png "有边框")  
![无边框 Image](https://github.com/GengGode/Mtalab_HexagonalGridCallularAutomata_plot/blob/master/Image/Snipaste_2020-08-05_00-15-46.png "无边框")  
> 其中绘制边框的开销比填充多边形都大（具体可以看Image中的截图，采用Matlab自带的查探器测试所得）

| 测试类型 | 函数 | 时间 |
| :-----: | :----: | :----: |
| 有边框 | fill() | 9.163s |
| 有边框 | plot() | 11.283s |
| 无边框 | fill() | 8.895s |

(其中figure()函数开销剧增，不知为何)  
------------------------------------------
### 历史记录
2019.02.28：  
由于plot绘制效率较低，改用line绘制   
2019.03.01：   
在重绘函数中减少了for循环的使用，并优化了重绘机制    
