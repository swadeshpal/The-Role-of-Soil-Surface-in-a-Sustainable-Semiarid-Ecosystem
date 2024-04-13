clear all
format long

tiledlayout(1,2,'TileSpacing','Compact','Padding','tight');
nexttile
hold on 
view(65,28)
load Hopf_Bif_Mu.mat
p1 = surf(Gamma,Alpha,MU,'EdgeColor','none','FaceColor', [1, 0, 1],'FaceAlpha',0.5);

pause(1)
load Transc_Bif_ws_Mu.mat
p2=surf(Gamma,Alpha,MU1,'EdgeColor','none','FaceColor', [0, 0, 1],'FaceAlpha',0.5);
view(59,19)


xlim([Gamma(1) Gamma(end)])
ylim([Alpha(1) Alpha(end)])
zlim([0.6 0.95])

% return
ax = gca;
box on
ax.BoxStyle = 'full';

ax.XTick=[0.09 0.1 0.11 0.12];
ax.YTick=[1 1.5 2 2.5];
ax.ZTick=[0.6 0.7 0.8 0.9];

xlabel('$$\gamma$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
ylabel('$$\alpha$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
zlabel('$$\mu$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
title('(a)','FontSize',16,'FontWeight','bold','Color','k')

clear all
load('Fig_1b.mat');

nexttile
TCAl = NaN*ones(1,P2);
TCGm = NaN*ones(1,P2);
TCB = NaN*ones(1,P2);
for j=2:508
    ind = 0;
    for k=2:P1
        if SUF_4U(j,k)>0 && ind == 0 && SUF_4U(j,k-1) < 0.3375
            TCAl(j) = (0.95*Alpha(k-1)+0.05*Alpha(k));
            TCGm(j) = 0.5*(Gamma(j-1)+Gamma(j));
            TCB(j) = SUF_4U(j,k);
            ind = ind+1;
        end
    end
end

HAl = NaN*ones(1,P2);
HGm = NaN*ones(1,P2);
HB = NaN*ones(1,P2);
for j=1:P2
    ind = 0;
    for k=1:P1
        if SUF_2U(j,k)>0 && ind == 0 
            HAl(j) = 0.5*(Alpha(k-1)+Alpha(k));
            HGm(j) = 0.5*(Gamma(j-1)+Gamma(j));
            HB(j) = SUF_2U(j,k);
            ind = ind+1;
        end
    end
end
hold on
plot3(HAl,HGm,HB,'-m','LineWidth',1.0)
plot3(TCAl,TCGm,TCB,'-b','LineWidth',1.0)

surf(Alpha,Gamma,SUF_1S,'EdgeColor','none','FaceColor', [0, 0, 0],'FaceAlpha',0.4);

surf(Alpha,Gamma,SUF_2S,'EdgeColor','none','FaceColor', [0, 0, 0],'FaceAlpha',0.4);
surf(Alpha,Gamma,SUF_2U,'EdgeColor','none','FaceColor', [0.3010, 0.7450, 0.9330],'FaceAlpha',0.4);
surf(Alpha,Gamma,SUF_3S,'EdgeColor','none','FaceColor', [0, 0, 0],'FaceAlpha',0.4);
surf(Alpha,Gamma,SUF_3U,'EdgeColor','none','FaceColor', [0.3010, 0.7450, 0.9330],'FaceAlpha',0.4);
surf(Alpha,Gamma,SUF_4S,'EdgeColor','none','FaceColor', [0, 0, 0],'FaceAlpha',0.4);
surf(Alpha,Gamma,SUF_4U,'EdgeColor','none','FaceColor', [0.3010, 0.7450, 0.9330],'FaceAlpha',0.4);

view(27,-15)

ylim([Gamma(1) Gamma(end)])
xlim([Alpha(1) Alpha(end)])

ax = gca;
box on
ax.BoxStyle = 'full';

ax.YTick=[0.09 0.1 0.11 0.12];
ax.XTick=[1 1.5 2 2.5];
ax.ZTick=[0 1 2 3];

ylabel('$$\gamma$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
xlabel('$$\alpha$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
title('(b)','FontSize',16,'FontWeight','bold','Color','k')

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 5])
print -dpng Fig_1.png -r500
print -depsc Fig_1.eps -r500