function pick=roulette_wheel_selection(fit_prob,n)
offs=zeros(n,2);
back=0.0;
for i=1:n
    offs(i,1)=back;
    offs(i,2)=back+fit_prob(i,1);
    back=back+fit_prob(i,1);
end
pick=zeros(n,1);
for i=1:n
   r=rand(1);
   for j=1:n
       if r<offs(j,2) && r>=offs(j,1)
           pick(i,1)=j;
           break;
       end
   end
end
end