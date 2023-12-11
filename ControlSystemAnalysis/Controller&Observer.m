close all
%clear all

t=0.001;

%State space representation-open loop
A=[0 1 0; 0 -2 2; 0 0 -8]; %state matrix
B=[0;0;60]; %input matrix
C=[1 0 0]; %output matrix
D=0; %direct transmission matrix

%Transfer functions
%G1
num_g1=[1];
den_g1=[1 0];
G1=tf(num_g1,den_g1);
%G2
num_g2=[2];
den_g2=[1 2];
G2=tf(num_g2,den_g2);
%G3
num_g3=[60];
den_g3=[1 8];
G3=tf(num_g3,den_g3);

%Transient response specifications
S_TL=stepinfo(G3);
S_AS=stepinfo(G3*G2);

%Step responses
figure('Name','Transient Response of Open Loop System | Topic 3')
subplot(3,1,1)
step(G3);
title('Torque Load')
subplot(3,1,2)
step(G3*G2);
title('Angular Speed')
subplot(3,1,3)
step(G3*G2*G1);
title('Response of System')

%Poles diagram
figure('Name','Poles Diagram | Topic 3')
pzmap(G3*G2*G1)
grid on

%Closed-loop system design
%Definition of transient response specifications
t_settling=2;
t_rise=0.3; % 10% -> 90%
p=20;

%Zeta
zeta=roots([1.4 1.1 1 (-3*t_rise)/t_settling]);
zeta=zeta(imag(zeta)==0);

%w
w=4/(t_settling*zeta); % 2% criterion

%Gains
K1=(p*(w^2))/120;
K3=(2*w*zeta+p-10)/60;
K2=(w^2+2*p*w*zeta-16-120*K3)/120;
K=[K1 K2 K3];

Acl=A-B*K; %Closed loop state-space

s1=ss(Acl,B,C,D);
S=stepinfo(s1);

 k=1;
   while S.RiseTime < 0.3
          k=k+1;
          p=p-0.01;
          zeta=roots([1.4 1.1 1 (-3*S.RiseTime)/S.SettlingTime]);
          zeta=zeta(imag(zeta)==0);
          omega=4/(S.SettlingTime*zeta);
          K1=(p*(omega^2))/120;
          K3=(2*omega*zeta+p-10)/60;
          K2=(omega^2+2*p*omega*zeta-16-120*K3)/120;
          K=[K1 K2 K3];
          Acl=A-B*K;
          s1=ss(Acl,B,C,D);
          S=stepinfo(s1);
      end
        
%Closed loop: state space
figure('Name','Transient Response - Closed Loop | Topic 4')
step(Acl,B,C,D) %the matrixes B,C,D remain the same.
grid on

%Calculating poles of closed loop system
p_cl=eig(Acl);

%Initial conditions and response
t3=0:t:1.2;
figure('Name','Transient Response - Initial Conditions | Topic 5')
%Initial conditions plots
x_init=[0;0;1]; 
%[y3,x3,t3]=initial(Acl,B,C,D,x_init,t3);
[y3,x3,t3]=initial(Acl,eye(3),eye(3),eye(3),x_init,t3);
subplot(3,1,1);
plot(t3,y3)
grid on
ylabel('Output')
subplot(3,1,2);
plot(t3,x3(:,1),t3,x3(:,2),t3,x3(:,3))
grid on
ylabel('States')
legend('Angle','Angular Speed','Torque Load');
subplot(3,1,3);
plot(t3,-K*x3');
grid on
ylabel('Control')
xlabel('Time (seconds)')

%Disturbance response
num_gd=[2 16+120*K(3)];
den_gd=[1 (10+60*K(3)) (16+120*K(3)+120*K(2)) 120*K(1)];
[A_d,B_d,C_d,D_d]=tf2ss(num_gd,den_gd);

[y4,x4,t4]=step(A_d,B_d,C_d,D_d);
figure('Name','Transient Response - Disturbance TF | Topic 6')
subplot(3,1,1);
plot(t4,y4)
grid on
ylabel('Output')
subplot(3,1,2);
plot(t4,x4(:,1),t4,x4(:,2),t4,x4(:,3))
grid on
ylabel('States')
legend('Angle','Angular Speed','Torque Load');
subplot(3,1,3);
plot(t4,-K*x4');
grid on
ylabel('Control')
xlabel('Time (seconds)')

%Simulink data
%Data are saved in workspace by Simulink
figure('Name','Disturbance, Control, Response')
subplot(3,1,1);
plot(dis_sim.time,dis_sim.data)
grid on
ylabel('Disturbance')
subplot(3,1,2);
plot(u_sim.time,u_sim.data)
grid on
ylabel('Control')
subplot(3,1,3);
plot(y_sim.time,y_sim.data);
grid on
ylabel('Response')
xlabel('Time (seconds)')


%Observer design
p_obs=2.5*max(real(p_cl));

coef=[1 0 0; 10 1 0; 16 8 2];
eqs=[-10-p_obs;-16+3*(p_obs^2);-p_obs^3];
Kf=coef\eqs;

%Data are saved in workspace by Simulink
figure('Name','Simulink Observer: Control, Response, Error')
subplot(3,1,1);
plot(u_obs.time,u_obs.data)
grid on
ylabel('Control')
subplot(3,1,2);
plot(y_obs.time,y_obs.data)
grid on
ylabel('Response')
subplot(3,1,3);
plot(error_obs.time,error_obs.data);
grid on
ylabel('Error')
xlabel('Time (seconds)')

figure('Name','Simulink Observer: Error in States')
plot(error_states_obs.time,error_states_obs.data(:,1),error_states_obs.time,...
    error_states_obs.data(:,2),error_states_obs.time,error_states_obs.data(:,3))
legend('x_1-x_1_h_a_t: Angle Error','x_2-x_2_h_a_t: Angular Speed Error',...
    'x_3-x_3_h_a_t: Torque Load Error')


