%% Sano %%
%============================ Condizioni Basali ==========================%

t_sim=12*60; %[min]
% Valori basali
G_b=91.76;  %[mg/dl] in [70;115] (91.76 per identificazione) 
I_b=4.2310; %[microU/ml] in [4.9776;28.87] ,*6.027 per portarlo in pmol/l (25.5002/6.027 per identif)
H_b=70; %[pg/ml] in [50;160]
EHP_b=3; %[pg/(ml*min)] in [0.6;1.2]

%=============================== Glucosio ================================%

G_th=60; %[mg/dl]
p1=0.041415; %Sg [1/min] sensibilità al glucosio
p2=0.00512; %[1/min]
p3=4.0691*10^(-6);
k7=0.48337; %mg/(min*dl)]
k8=0.48678; %[pg/ml]
Vg=1.45; %[dl/kg]
mu=0.0005;
theta=300;

%================================ Pasto ==================================%

cibo=78; %[mg] porzione di carboidrati mangiati
cibo1=50;
cibo2=90;
cibo3=60;
b1= 328.0451;
b2=11.5533;
e1=3.8430;
e2=0.1813;


%=============================== Insulina ================================%
p4=0.070232; %[1/min]
p5=G_b;
p6=0.090726; %[1/min]
p7=0.039391; %[1/min]
p8=0.035116; %[microU/(ml*min) per mg/dl]
k=0.732;

%=============================== Glucagone ===============================%
h1=0.096255; 
h3=0.091653;
h2=EHP_b*(h3*I_b+1)/(G_b-G_th);
h4= 0.11203;
h5=0.088319;
h6=0.24489;
% Promemoria per simulazione %
disp("DISATTIVARE LO SWITCH SU INSULINA") 

%======================== Scelta del tipo di pasto =======================%

prompt="Simuliamo per 3 pasti? Y/N [N]:";
txt=input(prompt,"s");
if isempty(txt)
    txt='N';                          %se premi direttamente invio è un no
end

if txt=='Y'
    disp('Ok 3 pasti')
    t_sim = 24*60;
    TrePasti = 1;
else
    disp('Singolo pasto')
    TrePasti = 0;
end
open("Modello_Paolo.slx");

%================== Salvataggio parametri in struttura ===================%

par.G_b=G_b;par.I_b=I_b;par.H_b=H_b;par.EHP_b=EHP_b;par.t_sim=t_sim;
par.G_th=G_th;par.p1=p1;par.p2=p2;par.p3=p3;par.k7=k7;par.k8=k8;par.Vg=Vg;par.cibo=cibo;par.b1=b1;par.b2=b2;par.e1=e1;par.e2=e2;par.mu=mu;par.theta=theta;
par.p4=p4;par.p5=p5;par.p6=p6;par.p7=p7;par.p8=p8;par.k=k;
par.h1=h1;par.h2=h2;par.h3=h3;par.h4=h4;par.h5=h5;par.h6=h6;
par.cibo1=cibo1;par.cibo2=cibo2;par.cibo3=cibo3;
par.TrePasti=TrePasti;
%% Diabetico Tipo 1
%============================ Condizioni Basali ==========================%

t_sim=12*60; %[min]
G_b=130;  %[mg/dl] in [80;180] 
I_b=0; %[microU/ml] in [0;1.1614] ,*6.027 per portarlo in pmol/l 
H_b=95; %[pg/ml] in [50;160]
EHP_b=5; %[pg/(ml*min)] in [1.5;2.5]

%=============================== Glucosio ================================%

G_th=60; %[mg/dl]
p1=0.041415; %Sg [1/min] sensibilità al glucosio
p2=0.00512; %[1/min]
p3=4.0691*10^(-6);
k7=0.48337; %mg/(min*dl)]
k8=0.48678; %[pg/ml]
Vg=1.45; %[dl/kg]
mu=0.0005;
theta=300;

%================================ Pasto ==================================%

cibo=78; %[mg] porzione di carboidrati mangiati
cibo1=50;
cibo2=90;
cibo3=60;
b1= 328.0451;
b2=11.5533;
e1=3.8430;
e2=0.1813;

%=============================== Insulina ================================%

p4=0.070232; %[1/min]
p5=G_b;
p6=0.090726; %[1/min]
p7=0.039391; %[1/min]
p8=0.035116; %[microU/(ml*min) per mg/dl]
k=0.732;

%=============================== Glucagone ===============================%

h1=0.096255; 
h3=0.091653;
h2=EHP_b*(h3*I_b+1)/(G_b-G_th);
h4= 0.11203;
h5=0.088319;
h6=0.24489;
% Promemoria per simulazione %
disp("RICORDATI DI ATTIVARE LO SWITCH SU INSULINA")

%======================== Scelta del tipo di pasto =======================%

prompt="Simuliamo per 3 pasti? Y/N [N]:";
txt=input(prompt,"s");
if isempty(txt)
    txt='N';                          %se premi direttamente invio è un no
end

if txt=='Y'
    disp('Ok 3 pasti')
    t_sim = 24*60;
    TrePasti = 1;
else
    disp('Singolo pasto')
    TrePasti = 0;
end
open("Modello_Paolo.slx");

%================== Salvataggio parametri in struttura ===================%

par.G_b=G_b;par.I_b=I_b;par.H_b=H_b;par.EHP_b=EHP_b;par.t_sim=t_sim;
par.G_th=G_th;par.p1=p1;par.p2=p2;par.p3=p3;par.k7=k7;par.k8=k8;par.Vg=Vg;par.cibo=cibo;par.b1=b1;par.b2=b2;par.e1=e1;par.e2=e2;par.mu=mu;par.theta=theta;
par.p4=p4;par.p5=p5;par.p6=p6;par.p7=p7;par.p8=p8;par.k=k;
par.h1=h1;par.h2=h2;par.h3=h3;par.h4=h4;par.h5=h5;par.h6=h6;
par.cibo1=cibo1;par.cibo2=cibo2;par.cibo3=cibo3;
par.TrePasti=TrePasti;
%% Diabetico Tipo 2
%============================ Condizioni Basali ==========================%

t_sim=12*60; %[min]
G_b=130;  %[mg/dl] in [80;130] (130 per ident)
I_b=9.9345; %[microU/ml] in [9.9552;49.776] ,*6.027 per portarlo in pmol/l (9.9345 per identif)
H_b=120; %[pg/ml] in [50;160]
EHP_b=7; %[pg/(ml*min)] in [2;3]

%=============================== Glucosio ================================%

G_th=60; %[mg/dl]
p1=0.0071337; %Sg [1/min] sensibilità al glucosio
p2=0.046552; %[1/min]
p3=8.2334*10^(-6);
k7=0.17079; %mg/(min*dl)]
k8=0.088863; %[pg/ml]
Vg=1.45; %[dl/kg]
mu=0.00032075;
theta=300;

%================================ Pasto ==================================%

cibo=78; %[mg] porzione di carboidrati mangiati
cibo1=50;
cibo2=90;
cibo3=60;
b1= 682.5888;
b2=14.6911;
e1=5.1976;
e2=0.17872;

%=============================== Insulina ================================%

p4=0.15744; %[1/min]
p5=G_b;
p6=0.031963; %[1/min]
p7=0.021764; %[1/min]
p8=0.0011994; %[microU/(ml*min) per mg/dl]
k=0.10893;

%=============================== Glucagone ===============================%

h1=0.081389; 
h3=0.17993;
h2=EHP_b*(h3*I_b+1)/(G_b-G_th);
h4=0.11;
h5=0.09;
h6=0.244;
% Promemoria per simulazione %
disp("DISATTIVARE LO SWITCH SU INSULINA")

%======================== Scelta del tipo di pasto =======================%

prompt="Simuliamo per 3 pasti? Y/N [N]:";
txt=input(prompt,"s");
if isempty(txt)
    txt='N';                          %se premi direttamente invio è un no
end

if txt=='Y'
    disp('Ok 3 pasti')
    t_sim = 24*60;
    TrePasti = 1;
else
    disp('Singolo pasto')
    TrePasti = 0;
end
open("Modello_Paolo.slx");

%================== Salvataggio parametri in struttura ===================%

par.G_b=G_b;par.I_b=I_b;par.H_b=H_b;par.EHP_b=EHP_b;par.t_sim=t_sim;
par.G_th=G_th;par.p1=p1;par.p2=p2;par.p3=p3;par.k7=k7;par.k8=k8;par.Vg=Vg;par.cibo=cibo;par.b1=b1;par.b2=b2;par.e1=e1;par.e2=e2;par.mu=mu;par.theta=theta;
par.p4=p4;par.p5=p5;par.p6=p6;par.p7=p7;par.p8=p8;par.k=k;
par.h1=h1;par.h2=h2;par.h3=h3;par.h4=h4;par.h5=h5;par.h6=h6;
par.cibo1=cibo1;par.cibo2=cibo2;par.cibo3=cibo3;
par.TrePasti=TrePasti;