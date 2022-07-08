function dydt = odefunc(t, y, l1, l2, m1, m2, g)
    theta1 = y(1);
    theta2 = y(2);
    omega1 = y(3);
    omega2 = y(4);
    dydt = zeros(4, 1);
    dydt(1) = omega1;
    dydt(2) = omega2;
    dydt(3) = ( (l2^2) * ( -2*m2*l1*l2*(omega2^2)*sin(theta1 - theta2) - (m1 + 2*m2)*g*l1*sin(theta1) ) + ( -1 * m2 * 2*l1*l2*cos(theta1-theta2) ) * ( 2*l1*l2*(omega1^2)*sin(theta1 -theta2) - g*l2*sin(theta2) ) ) / ( (m1 + 4*m2) * (l1^2) * (l2^2) - m2*( 4*(l1^2)*(l2^2)*(cos(theta1 - theta2))^2 ) );
    dydt(4) = ( (-1 * 2*l1*l2*cos(theta1-theta2) ) * ( -2*m2*l1*l2*(omega2^2)*sin(theta1 - theta2) - (m1 + 2*m2)*g*l1*sin(theta1) ) + ( (m1 + 4*m2) * (l1)^2) * ( 2*l1*l2*(omega1^2)*sin(theta1 -theta2) - g*l2*sin(theta2) )) / ( (m1 + 4*m2) * (l1^2) * (l2^2) - m2*( ( 4*(l1^2)*(l2^2)*(cos(theta1 - theta2))^2 ) ) );
end