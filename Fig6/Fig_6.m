clear all
format long

load('Fig6Data.mat')

tiledlayout(1,2,'TileSpacing','Compact','Padding','tight');

nexttile
pcolor(X,Y,VF1);shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
pause(0.0001)
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(a)','FontSize',16,'FontWeight','bold','Color','k')


nexttile
pcolor(X,Y,VF2);shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
pause(0.0001)
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(b)','FontSize',16,'FontWeight','bold','Color','k')


set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 4])
print -dpng Fig_6.png -r1000
print -depsc Fig_6.eps -r500
