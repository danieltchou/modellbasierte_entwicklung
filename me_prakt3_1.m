% Parameter
c = 150;
d = 1;

% Zeitbereich
tspan = [0 20];

% Anfangsbedingungen: x(0)=0.2, xdot(0)=0
x0 = [0.2; 0];

% Differentialgleichungssystem
f = @(t, y) [
    y(2);
    -(1 / (5 - 0.2 * t)) * (c * y(1) + d * y(2))
];

% Numerische Lösung
[t, y] = ode45(f, tspan, x0);

% Masseverlauf
m = 5 - 0.2 * t;

% Ergebnisse plotten
figure;
subplot(3,1,1);
plot(t, y(:,1));
title('Weg x(t)');
xlabel('Zeit [s]');
ylabel('x(t) [m]');

subplot(3,1,2);
plot(t, y(:,2));
% title('Geschwindigkeit \dot{x}(t)');
xlabel('Zeit [s]');
ylabel('v(t) [m/s]');

subplot(3,1,3);
plot(t, m);
title('Masse m(t)');
xlabel('Zeit [s]');
ylabel('m(t) [kg]');
