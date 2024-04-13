% clear all
% format long
% 
% npx=500;
% 
% dx = 0.0125;
% 
% for n=1:npx
%     if n==1
%         nf = sprintf("VN_%d.dat",n-1);
%         TL(:,:) = load(nf);
%     end
%     if n==npx
%         nf = sprintf("VN_%d.dat",n-1);
%         TR(:,:) = load(nf);
%     end
%     if n>1 && n < npx
%         nf = sprintf("VN_%d.dat",n-1);
%         TM(:,:,n) = load(nf);
%     end 
% end
% 
% 
% xe = length(TL(1,:))-3;
% Nx = npx*xe+1;
% Ny = length(TL(:,1));
% % 
% for j=1:Nx
%     X(j)=(j-1)*dx;
% end
% for j=1:Ny
%     Y(j)=(j-1)*dx;
% end
% 
% VF(:,:)=TL(1:Ny,2:xe+2);
% for n=1:npx-2
%     for k=1:Ny
%         for j=1:xe+1
%             VF(k,n*xe+j)=TM(k,j,n+1);
%         end
%     end
% end
% 
% VF(:,(npx-1)*xe+1:Nx)=TR(1:Ny,1:xe+1);

VFM = VF;
tiledlayout(1,1,'TileSpacing','Compact','Padding','tight');
for k=2:8000
    for j=1:101 
        VFM(j,k) = (2*VF(101,k)+VF(101,k-1)+VF(101,k+1))/4;
    end
end

nexttile
pcolor(X,Y,VFM);shading interp;colormap jet; axis tight equal
box on
pause(0.0001)
ax = gca;
ax.XTick=[0 10 20 30 40 50 60 70 80 90 100];
ax.YTick=[0 10 20 30 40 50];
xlabel('$$d_{w}$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
ylabel('$$d_{u}$$','Interpreter', 'Latex','FontSize',14,'FontWeight','bold','Color','k')
% 
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 5])
print -dpng Fig_2.png -r500
print -depsc Fig_2.eps -r500
