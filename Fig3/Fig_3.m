clear all
format long

% npx=400;
% 
% dx = 0.25;
% for kk=1:4
%     clear VF
%     if kk==1
%         cd Fig3a
%     end
%     if kk==2
%         cd Fig3b
%     end
%     if kk==3
%         cd Fig3c
%     end
%     if kk==4
%         cd Fig3d
%     end
% 
%     for n=1:npx
%         if n==1
%             nf = sprintf("VN_%d.dat",n-1);
%             TL(:,:) = load(nf);
%         end
%         if n==npx
%             nf = sprintf("VN_%d.dat",n-1);
%             TR(:,:) = load(nf);
%         end
%         if n>1 && n < npx
%             nf = sprintf("VN_%d.dat",n-1);
%             TM(:,:,n) = load(nf);
%         end 
%     end
% 
%     cd ..
% 
%     xe = length(TL(1,:))-1;
%     Nx = npx*xe+1;
%     Ny = Nx;
%     % 
%     for j=1:Nx
%         X(j)=(j-1)*dx;
%         Y(j)=(j-1)*dx;
%     end
% 
%     VF(:,:)=TL(1:Ny,1:xe+1);
%     for n=1:npx-2
%         for k=1:Ny
%             for j=1:xe+1
%                 VF(k,n*xe+j)=TM(k,j,n+1);
%             end
%         end
%     end
% 
%     VF(:,(npx-1)*xe+1:Nx)=TR(1:Ny,1:xe+1);
% 
%     if kk==1
%         VF1 = VF;
%     end
%     if kk==2
%         VF2 = VF;
%     end
%     if kk==3
%         VF3 = VF;
%     end
%     if kk==4
%         VF4 = VF;
%     end
% 
% end

load('Fig_3Data.mat')

tiledlayout(1,4,'TileSpacing','Compact','Padding','tight');

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

nexttile
pcolor(X,Y,VF3);shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
pause(0.0001)
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(c)','FontSize',16,'FontWeight','bold','Color','k')

nexttile
pcolor(X,Y,VF4);shading interp; colorbar('NorthOutside'); colormap jet; axis tight equal
box on
pause(0.0001)
ax = gca;
ax.XTick=[ ];
ax.YTick=[ ];
xlabel('(d)','FontSize',16,'FontWeight','bold','Color','k')

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 15 4])
print -dpng Fig_3.png -r1000
print -depsc Fig_3.eps -r500
