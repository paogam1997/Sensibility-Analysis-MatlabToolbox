G_sim=out.G_sim.Data;
I_sim=out.I_sim.Data;
H_sim=out.H_sim.Data;
Ra_sim=out.Ra.Data;
time_sim=out.G_sim.Time;
run("interp_segnali.m")
figure()
subplot(2,3,1); plot(time_sim,G_sim, ...
                time_sim, G_data_interp)
xlabel('tempo [min]');ylabel('G [mg/dl]'); title('Glucosio nel plasma')

subplot(2,3,2); plot(time_sim,I_sim, ...
                time_sim, I_data_interp)
xlabel('tempo [min]');ylabel('I [pmol/l]'); title('Insulina nel plasma')

subplot(2,3,5); plot(time_sim,Ra_sim, ...
                time_sim, Ra_data_interp)
xlabel('tempo [min]');ylabel('Ra [mg/(dl*min)]'); title('Glucosio ingerito')

legend('simulato','dato')
