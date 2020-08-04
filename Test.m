
a=rand(10,1000);
s1=a;
s2=a;


tic
s2(s2>0.5)=0;
toc

tic
s1(find(s1>0.5))=0;
toc



