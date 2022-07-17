function [x2, y2] = DoublePendulum(l1, l2)
% initial value
    m1 = l1;
    m2 = l2;
    g = 9.80;
    theta1 = 2*pi/3;
    theta2 = pi/2;
    omega1 = 0;
    omega2 = 0;
    tspan = [0 50];
    u0 = [theta1 theta2 omega1 omega2];

    % Compute answer of ODE. 
    [t, u] = ode23s(@(t, u) odefunc(t, u, l1, l2, m1, m2, g), tspan, u0);
    x2 = 2*l1*sin(u(:, 1)) + l2*sin(u(:, 2));
    y2 = -2*l1*cos(u(:, 1)) - l2*cos(u(:, 2));
end