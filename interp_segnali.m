%Avvio simulazione di riferimento
run("simulazione_riferimento.m");
%carico i dati provenienti dalla simulazione
G_sim=out.G_sim.Data;
I_sim=out.I_sim.Data;
% f_sim=out.f_sim.Data;
H_sim=out.H_sim.Data;
time_sim=out.G_sim.Time;

%interpolo i dati sperimentali per riportarli agli stessi istanti dati in
%time_sim
[time_data_unique,idx]=unique(time_data);
G_data_unique=G_data(idx);
I_data_unique=I_data(idx);
G_prod_data_unique=G_prod_data(idx);
Ra_data_unique=Ra_data(idx);
G_util_data_unique=G_util_data(idx);
I_secr_data_unique=I_secr_data(idx);%fin qua ho dovuto escludere i valori doppioni sennò non funziona interp1

G_data_interp=interp1(time_data_unique,G_data_unique,time_sim); %time_data è in min
I_data_interp=interp1(time_data_unique,I_data_unique,time_sim);
G_prod_data_interp=interp1(time_data_unique,G_prod_data_unique,time_sim);
Ra_data_interp=interp1(time_data_unique,Ra_data_unique,time_sim);
G_util_data_interp=interp1(time_data_unique,G_util_data_unique,time_sim);
I_secr_data_interp=interp1(time_data_unique,I_secr_data_unique,time_sim);
%ora i _data_unique sono tanti quanti i _sim
