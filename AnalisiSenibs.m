%% simulazone modello Glucosio-Insulina-Glucagone
% tempo di simulazione
t_sample = 0.01;
T_sim = 0:t_sample:60*24;
%creazione funzione ode
odemodello=@(t,x) modello(t,x,par);
options=odeset('RelTol',1e-5,'AbsTol',1e-5);



range_G_b=90:10:120;
for i= 1:1:length(range_G_b)
    par.G_b = range_G_b(i);
    % condizioni iniziali
    X0 = [par.G_b; 0; par.I_b; 0; par.H_b; 0]; % stato a 6 variabili
    %%%%% simulazione del modello con ode45
    [simT, simOUT] = ode45(odemodello,T_sim,X0,options);

    % plot dei risultati
    plot(simT,simOUT(:,1)); hold on
end





%%  MODELLO DEFINITO CON ODE %%

function [Xdot] = modello(t,state,par)
% G_b=par.G_b;I_b=par.I_b;H_b=par.H_b;EHP_b=par.EHP_b;t_sim=par.t_sim;
% par.G_th=G_th;par.p1=p1;par.p2=p2;par.p3=p3;par.k7=k7;par.k8=k8;par.Vg=Vg;par.cibo=cibo;par.b1=b1;par.b2=b2;par.e1=e1;par.e2=e2;par.mu=mu;par.theta=theta;
% par.p4=p4;par.p5=p5;par.p6=p6;par.p7=p7;par.p8=p8;par.k=k;
% par.h1=h1;par.h2=h2;par.h3=h3;par.h4=h4;par.h5=h5;par.h6=h6;
% calcolo Ra(t) ingrsso pasto
Ra = par.cibo*par.b1*t^(par.e1)*exp(-par.b2*t^(par.e2));
% rinomino lo stato
G = state(1); % G
X = state(2); % X
I = state(3); % I 
Y = state(4); % Y
H = state(5); % H
Z = state(6); % Z

%%% DIANMICA GLUCOSIO
if G>par.theta
    E = par.mu*(G-par.theta);
else
    E=0;
end

dG = -(par.p1+X)*G + par.p1*par.G_b + Ra/par.Vg + ( par.k7*H/(par.k8+H) - par.k7*par.H_b/(par.k8+par.H_b) ) - E;
dX = -par.p2*X + par.p3*(I-par.I_b);

%%% DINAMICA INSULINA
dI = par.p4*Y + par.k*dG - par.p6*(I-par.I_b);

if G>par.G_b
    dY = -par.p7*Y + par.p8*(G-par.G_b);
else % G <= G_b
    dY = -par.p7*Y;
end


%%% DINAMICA GLUCAGONE
dH = -par.h1*(H-par.H_b) + ( par.EHP_b*(par.h3*par.I_b+1)/(par.G_b-par.G_th) )*(par.G_th-G)/(par.h3*I+1) + par.EHP_b + par.h4*Z;
if G<par.G_b
    dZ = -par.h5*Z + par.h6*(par.G_b-G);
else % se G>=G_b
    dZ=-par.h5*Z;
end

Xdot = [dG;dX; dI;dY; dH;dZ];

end

