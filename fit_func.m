function fit=fit_func(chromo,m)
fit=0;
for j=1:m
    if chromo(1,j)==1
        fit=fit+1;
    end
end
end