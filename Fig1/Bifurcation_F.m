clear all
format long

N = 301;
P1 = 301;
P2 = 801;


Alpha = linspace(0.9375,2.8125,P1);
beta = 0.45; 
Gamma = linspace(0.088,0.12175,P2); 
hh = 1.0;  
Mu = linspace(0.7,1,N);  
sigma = 0.05; 

hold on
 view(45,45)
for n=1:N
    mu = Mu(n);
    disp(mu)
    for j=1:P1
        clear index
        alpha = Alpha(j);
        GAMMA(n,j) = NaN;
        for k=1:P2
            
            gamma = Gamma(k);

            ue = alpha*(gamma*mu - sigma)^2/(hh^2*sigma^2 + (gamma*mu - sigma)^2);
            ve = sigma*hh/(gamma*mu - sigma); 
            we = mu*(-beta*ve + alpha - ue)/sigma;

            if ue>0 && ve >0 && we > 0
                us = ue;
                vs = ve;
                ws = we;

                Jac=[-vs^2-1,-2*us*vs,0;
                     vs^2,2*us*vs-beta-(gamma*ws)/(vs+hh)+(gamma*vs*ws)/((vs+hh)^2),-(gamma*vs)/(vs+hh);
                     0,(mu*gamma*ws)/(vs+hh)-(mu*gamma*vs*ws)/((vs+hh)^2),(mu*gamma*vs)/(vs+hh)-sigma];
                EIG = eig(Jac);
                index(k) = 0;
                for m=1:3
                    if real(EIG(m))<0
                        index(k)=index(k)+1;
                    end
                end

                if k>1 && index(k-1) ~= index(k) && index(k-1) > 0 && index(k)>0
                    GAMMA(n,j) = gamma;
                    plot3(alpha,gamma,mu,'ob');            
                    pause(0.0001)
                end

            end
        end
    end
end