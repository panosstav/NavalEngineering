%At Port
x = TotalReeferUnitsOnboard2040ft;
y = TotalRunningHours;
[x,y] = meshgrid(x,y);
z = -0.558+0.000382*1408.6+x.*0.00241+y.*0.325;
figure
hold on
colorbar;
surf(x,y,z)
xlabel('Reefers');
ylabel('Running Time');
zlabel('Predicted FOC - At Port');
title('Mesh Plot of Predicted FOC with Reefers and Running Time');