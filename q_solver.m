clear all 
s = [-4.:0.01:-0.001, 0.001:0.01:4]; 
r = [-4.:0.01:-0.001, 0.001:0.01:4];
for i= 1:length(r)
    for j = 1 :length(s)  
    out = valueofq(s(j),r(i));  
    for k=1:length(out)
        z_(i, j, k) = out(k);
    end 
    end  
end 

%%
figure(1)
for i=1:k
    plot(s, real(z_(:,:,i)))
hold on 
end 
title(strcat('$\mathrm{Re}(q)$ vs $s$  $\gamma=$',num2str(r)))
ylabel('$\mathrm{Re}(q)$')
xlabel('$s$')
hold off 
%%
figure(2)
for i=1:k
    plot(s, imag(z_(:,:,i)))
hold on 
end 
hold off
title(strcat('$\mathrm{Im}(q)$ vs $\gamma$,  $s=$',num2str(s)))
ylabel('$\mathrm{Im}(q)$')
xlabel('s')
%%
figure(3) 
for i=1:k
    plot(real(z_(:,:,i)), imag(z_(:,:,i)))
hold on 
end 
title(strcat('$\mathrm{Re}(q)$ vs $\mathrm{Im}(q)$, $\gamma=$',num2str(r)))
xlabel('$\mathrm{Re}(q)$')
ylabel('$\mathrm{Im}(q)$')

function out=valueofq(s,g)
  c=-3*airy(1,0);
  correct=@(q,s,g) (-s+g*q.^2).*q.^(1/3)+c;
  root=@(s,g) roots([g,0,0,0,0,0,-s,c]);
  q=root(s,g).^3;
  out=q(find(lt(abs(correct(q,s,g)), 0.000000001)));
end