clc;
clear;
close all;

% Parameter vectors
Kp_vec = [0.25 1.0 5.0]; 
T_vec  = [0.01 0.2 0.5 1.0 2.0 5.0]; 

% Prepare results container
Y_results = cell(length(Kp_vec), length(T_vec)); 
model_name = 'me_prakt4_2';
block_name = 'Übertragungsfunktion'; % safer ASCII name if possible

open_system(model_name); 

disp('Running simulations...');

for i = 1:length(Kp_vec)
    current_Kp = Kp_vec(i);
    for j = 1:length(T_vec)
        current_T = T_vec(j);

        % Update PT1 transfer function: G(s) = Kp / (T*s + 1)
        set_param([model_name '/' block_name], ...
            'Kp', sprintf('[%f]', current_Kp), ...
            'T', sprintf('[%f %f]', current_T, 1));

        % Run simulation
        sim_out = sim(model_name, 'ReturnWorkspaceOutputs', 'on');

        % Store output (assuming "yout" is the logged variable)
        Y_results{i, j} = sim_out.get('yout'); 
    end
end

disp('Simulations finished. Plotting results...');

figure;
hold on;
title('PT1 Parameter Variation');
xlabel('Time (s)');
ylabel('Output y(t)');

for i = 1:length(Kp_vec)
    for j = 1:length(T_vec)
        dataset = Y_results{i, j};

        % Extract first element if dataset has multiple signals
        if isa(dataset, 'Simulink.SimulationData.Dataset')
            ts = dataset{1}.Values;  % first logged signal
        else
            ts = dataset;  % already a timeseries
        end

        plot(ts.Time, ts.Data, ...
            'DisplayName', sprintf('Kp=%.2f, T=%.2f', Kp_vec(i), T_vec(j)));
    end
end

hold off;
legend('Location', 'best');
grid on;

disp('Done.');
