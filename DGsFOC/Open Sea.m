x = TotalReeferUnitsOnboard2040ft;
y = TotalRunningHours;
[x,y] = meshgrid(x,y);
z = -4.315+0.00172*1408.6+x.*0.00658+y.*0.392; 
figure
hold on
colorbar;
surf(x,y,z)
xlabel('Reefers');
ylabel('Running Time');
zlabel('Predicted FOC - At Port');
title('Mesh Plot of Predicted FOC with Reefers and Running Time');