function newppn=newppn(ppn,pick,pc,pm,n,m)
newppn=zeros(size(ppn));
newppn=ppn;
nc=(pc*n);
nc=floor(nc);
nm=pm*n;
nm=ceil(nm);
for i=1:2:nc
    newppn(i:i+1,:)=single_point_crossover(ppn(pick(i,1),:),ppn(pick(i+1,1),:));
end
for i=1:nm
    p=randi(n,1);
    b=randi(m,1);
    if newppn(p,b)==1
        newppn(p,b)=0;
    else
        newppn(p,b)=1;
    end
end