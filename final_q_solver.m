%making a 3D surface plot 
clear all 
c=-3*airy(1,0);


s = [-4.:0.001:-0.001, 0.001:0.001:4]; 
r = 1;
for i= 1:length(r)
    
    for j = 1 :length(s)  
    out = valueofq(s(j),r(i));  
    for k=1:length(out)
        z_(i, j, k) = out(k);
    end 
    end  
    
end 



figure(1)
for i=1:k
    plot(s, real(z_(:,:,i)))
hold on 
end 
annotation('textarrow',[.8 .75],[.5 .6], 'String','P =-A + Axx = 0')
annotation('textarrow',[.8 .8],[.2 .12], 'String','P =-A; Viscous Term')
annotation('textarrow',[.45 .5],[.3 .2], 'String','Pure surface tension; Complex q')
a = annotation('textbox',[.2 .1 .4 .5],'String','Ceiling Flow; s<0','FitBoxToText','on')
a.Color = 'blue';
a = annotation('textbox',[.7 .2 .4 .5],'String','Floor Flow; s>0','FitBoxToText','on')
a.Color = 'blue';

x = 0:0.1:4;
y = 3*c./(x.^3);
plot(x, y, 'blue','LineStyle',':')
ylim([0 2])
hold on 
annotation('textarrow',[.7 .65],[.8 .75], 'String','q = 3c/s^3')

x = -4:0.1:0;
y = -3*c./(x.^3);
plot(x, y, 'red','LineStyle',':')
ylim([0 2])
hold on 
annotation('textarrow',[.35 .4],[.8 .8], 'String','q=-3c/s^3')

x_ = 0:0.001:4;
y_ = sqrt(x_); 
plot(x_, y_, 'green','LineStyle',':')
ylim([0 2])
annotation('textarrow',[.5 .55],[.4 .4], 'String','q = s^{1/2}')


xline(0, 'r--')
plot(0, 0.19963, 'r*')
hold off 

title(strcat('$\mathrm{Re}(q)$ vs $s$,  $\gamma$=',num2str(r)))
xlabel('$s$');ylabel('$\mathrm{Re}(q)$')

%%
figure(2)
for i=1:k
    plot(s, imag(z_(:,:,i)))
hold on 
end 
 
xline(0, 'r--')
hold off

a = annotation('textbox',[.2 .4 .4 .5],'String','Ceiling Flow; s<0','FitBoxToText','on')
a.Color = 'blue';
a = annotation('textbox',[.7 .4 .4 .5],'String','Floor Flow; s>0','FitBoxToText','on')
a.Color = 'blue';
annotation('textarrow',[.3 .3],[.7 .78], 'String','Region dominated by surface tension')
annotation('textarrow',[.65 .6],[.65 .6], 'String','Oscillations observed; influence of surface tension')
annotation('textarrow',[.8 .8],[.4 .5], 'String','No oscillations')

title(strcat('$\mathrm{Im}(q)$ vs $s$,  $\gamma=$',num2str(r)))
% title(strcat('$\mathrm{Re}(q)$ vs $s$,  $\gamma$=',num2str(r)))
% saveas(gcf,strcat('Imag q vs s gamma',num2str(s),'.png'))
ylabel('$\mathrm{Im}(q)$')
xlabel('s')

%%
figure(3) 
for i=1:k
    plot(real(z_(:,:,i)), imag(z_(:,:,i)))
hold on 
end 
xline(0, 'r--')
hold off 
title(strcat('$q$ vs $\gamma$, $\gamma=$',num2str(r)))
xlabel('$\mathrm{Re}(q)$');ylabel('$\mathrm{Im}(q)$')



function out=valueofq(s,g)
  c=-3*airy(1,0);
  correct=@(q,s,g) (-s+g*q.^2).*q.^(1/3)+c;
  root=@(s,g) roots([g,0,0,0,0,0,-s,c]);
  q=root(s,g).^3;
  out=q(find(lt(abs(correct(q,s,g)), 0.000000001)));
end