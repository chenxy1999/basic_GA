n=input('Enter population Size:');
m=input('Enter Chromosome length:');
% pc=input('Enter Crossover probability:');
% pm=input('Enter Mutation probability:');
ppn=zeros(n,m);
% run_count=0;
% for i=1:n
%     ppn(i,:)=randi(2,1,m)-1;
% end
%disp(ppn);
l=0;
k=0;
pc=0.1;
pm=0.1;
ab=zeros(10,4);
while pc<1
    l=l+1;
    run_count=0;
    for i=1:n
        ppn(i,:)=randi(2,1,m)-1;
    end
    k=0;
    while k==0;
        run_count=run_count+1;
        fit=zeros(n,1);
        fit_prob=zeros(n,1);
        total_fit=0;
        for i=1:n
            fit(i,1)=fit_func(ppn(i,:),m);
            if fit(i,1)==m
                fit_chromo=i;
                k=1;
            end
            total_fit=total_fit+fit(i,1);
        end
        for i=1:n
            fit_prob(i,1)=fit(i,1)/total_fit;
        end
        % disp(fit);
        % disp(total_fit);
        % disp(fit_prob);
        pick=zeros(n,1);
        pick=roulette_wheel_selection(fit_prob,n);
        %disp(pick);
        %k=input('Enter k:');
        if k==1
            break;
        end
        ppn=newppn(ppn,pick,pc,pm,n,m);
    end
    ab(l,:)=[pc,pm,run_count,fit_chromo];
    pc=pc+0.2;
    pm=pm+0.2;
    disp(ab(l,:));
end
% a=[transpose([1:n]),ppn,transpose([1:n])];
disp(ab);


