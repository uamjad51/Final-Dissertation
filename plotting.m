description=join([' with $P=-sA+\gamma A_{XX}$,',' $s=$', num2str(-1*pas), ', $\gamma=$', num2str(pagamma)]);

fig4=figure(1);
plot (tsol((1:nout),1),u4sol((1:nout),1))
x = tsol((1:nout),1);
y = u4sol((1:nout),1);
% hold on x
% plot(x(end), y(end), 'r*');
% xline(11, 'r--')
% xlim([0,12])

% annotation([.87 .87],[.5 .6],'String','P_{\infty}')
% annotation('textarrow',[.87 .87],[.5 .6],'String','P_{\infty}')
% text(11,-9.3,'X_0')

xlabel('$X$','interpreter','latex');
ylabel('$P(X)$','interpreter','latex');
title(join(['$P(X)$',description]), 'interpreter', 'latex')
savefig('PvsX.fig');pdfplot('PvsX.pdf');
hold off
%%
fig5=figure(2);
plot (tsol((1:nout),1),u5sol((1:nout),1))
hold on 
% xline(11, 'r--')
% xlim([0,12])
% text(11,-0.2,'X_0')

% a = -35:0.01:35;
% plot(a+28, -exp(a));
% ylim([-10 2])
% xlim([0,35])
% % % 
% annotation('textarrow',[.7 .8],[.15 .15],'String','A \sim-e^X')
% annotation('textarrow',[.8 .73],[.8 .8],'String','P = -A+A_{XX}')
% annotation('textarrow',[.7 .63],[.7 .7],'String','A \sim const X^2, constant < 0')

xlabel('$X$','interpreter','latex');
ylabel('$A(X)$','interpreter','latex');
title(join(['$A(X)$',description]), 'interpreter', 'latex')
savefig('AvsX.fig');pdfplot('AvsX.pdf');
hold off 
%%
fig6=figure(3);
plot (tsol((1:nout),1),u3sol((1:nout),1))
hold on 
% xline(11, 'r--')
% xlim([0,12])
% text(11,-0.5,'X_0')
% xlim([0,6.95])
yline(0, 'r--')
% annotation('ellipse',[.82 .17 .1 .2], 'Color','red')

% annotation('textarrow',[.73 .8],[.28 .25],'String','separation point; \tau < 0')
 

xlabel('$X$','interpreter','latex');
ylabel('$\tau(X)$','interpreter','latex');
title(join(['$\tau(X)$',description]), 'interpreter', 'latex')  
savefig('tauvsX.fig');pdfplot('tauvsX.pdf');
hold off 

%%
% Contour plotting
fig7=figure(4);
contourf(tsol(1:nout,:),gridy(xsol(1:nout,:),0),u1sol(1:nout,:));
xlabel('$X$','interpreter','latex');
ylabel('$Y$','interpreter','latex');
title(join(['$\psi(X,Y)$',description]), 'interpreter', 'latex')
savefig('psicontour.fig');pdfplot('psicontour.pdf');
fig8=figure(5);
contourf(tsol(1:nout,:),gridy(xsol(1:nout,:),0),u2sol(1:nout,:));
xlabel('$X$','interpreter','latex');
ylabel('$Y$','interpreter','latex');
title(join(['$U(X,Y)$',description]), 'interpreter', 'latex')
savefig('ucontour.fig');pdfplot('ucontour.pdf');
fig9=figure(6);
contourf(tsol(1:nout,:),gridy(xsol(1:nout,:),0),u3sol(1:nout,:));
xlabel('x');ylabel('y');title('U(x,y)')
xlabel('$X$','interpreter','latex');
ylabel('$Y$','interpreter','latex');
title(join(['$\tau(X,Y)$',description]), 'interpreter', 'latex')
savefig('taucontour.fig');pdfplot('taucontour.pdf');
