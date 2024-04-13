clear all
format long

load Fig5a.mat


tiledlayout(1,3,'TileSpacing','Compact','Padding','tight');

nexttile
pcolor(X,Y,VF);shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
pause(0.0001)
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(a)','FontSize',16,'FontWeight','bold','Color','k')


nexttile
plot(Time,SPA,'-b','LineWidth',1.2);
xlim([0 1200])
box on
pause(0.0001)
ax = gca;
ax.XTick=[0 400 800 1200];
ax.YTick=[0 1 2 3 4];
ylabel('$$<v>$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
xlabel('(b)','FontSize',16,'FontWeight','bold','Color','k')

load Fig5b.mat
nexttile
pcolor(X,Y,VF);shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
pause(0.0001)
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(c)','FontSize',16,'FontWeight','bold','Color','k')


set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 4])
print -dpng Fig_5.png -r1000
print -depsc Fig_5.eps -r500