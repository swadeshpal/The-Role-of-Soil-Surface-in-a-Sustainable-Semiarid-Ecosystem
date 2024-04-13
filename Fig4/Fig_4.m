clear all
format long


tiledlayout(2,3,'TileSpacing','Compact','Padding','tight');

nexttile
load('VF_0_0.mat')
pcolor(VF');shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(a)','FontSize',16,'FontWeight','bold','Color','k')
pause(0.0001)

nexttile
load('VF_10_0.mat')
pcolor(VF');shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(b)','FontSize',16,'FontWeight','bold','Color','k')
pause(0.0001)

nexttile
load('VF_0_10.mat')
pcolor(VF');shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(c)','FontSize',16,'FontWeight','bold','Color','k')
pause(0.0001)

nexttile
load('VF_10_10.mat')
pcolor(VF');shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(d)','FontSize',16,'FontWeight','bold','Color','k')
pause(0.0001)

nexttile
load('VF_30_10.mat')
pcolor(VF');shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(e)','FontSize',16,'FontWeight','bold','Color','k')
pause(0.0001)

nexttile
load('VF_10_30.mat')
pcolor(VF');shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(f)','FontSize',16,'FontWeight','bold','Color','k')
pause(0.0001)

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 6])
print -dpng Fig_4.png -r1000
print -depsc Fig_4.eps -r500
