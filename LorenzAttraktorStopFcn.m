% Grafische Darstellung der Signale aus lorenz_attractor.mdl 

% Achtung: zunaechst mit [size,x0,xstring] = lorenz_attractor
% ueberpruefen, wie die Zustuende von Simulink auf die
% drei Integratoren verteilt werden.

% bei Export als DataSet:
% x = xout.getElement('IntegratorX').Values.Data;
% y = xout.getElement('IntegratorY').Values.Data;
% z = xout.getElement('IntegratorZ').Values.Data;
% bei Export als Array:
x = out.xout(:,1);
y = out.xout(:,2);
z = out.xout(:,3);

% Ermittle die Wertebereiche der 3 Achsen um sie beim Plotten
% beruecksichtigen zu koennen:
disp(['x_{Min} = ',num2str(min(x))]);
disp(['x_{Max} = ',num2str(max(x))]);

disp(['y_{Min} = ',num2str(min(y))]);
disp(['y_{Max} = ',num2str(max(y))]);

disp(['z_{Min} = ',num2str(min(z))]);
disp(['z_{Max} = ',num2str(max(z))]);

figure
plot3(x,y,z);

% Die Wertebereiche der Achsen muessen angepasst werden (vgl. oben):
set(gca,'Xlim',[-15 15],'Ylim',[-22 22],'Zlim', [0 50], 'Fontsize',13);

view(-65,30)
xlabel('x');
ylabel('y');
zlabel('z');
title('lorenz strange attractor')
grid on;
hold on;