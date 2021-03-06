%% Inductance design for magnetics Kool M\mu 

%% system parameter
L= 105e-6; % henry 
% maximum load draws 10 A current, I will design 10% load is in 
% CCM mode then 2 A is chosen as current swing
I_max= 11; % A 
I_rms= 10; %A  

%% material property 
B_max= 0.5; % saturation at 1 Tesla

%% dimensions 
C= 11.2 ; %%mm
B=14.7 ; %%mm 
A= 26.9 ; %%mm
A_core= (A-B)*C/2 ; %% mm^2 
A_w= pi*B^2/4 ; % mm^2 
A_w= 156 ; % mm^2 

%% condcutor  AWG 25 
k_cu= 0.6; % copper 
A_cu= 0.162; % mm^2
J_rms= 4 ; % A/mm^2 
required_A_cu= I_rms/J_rms;
paralel_number= required_A_cu/A_cu;

%% trial for 
L_max =k_cu*J_rms*B_max*A_w*A_core*1e-6/I_max*I_rms;
N_max=k_cu*A_w/required_A_cu;
a=0;
for i=1:1000

if L_max > L
    A_w=0.8*A_w;
    L_max =k_cu*J_rms*B_max*A_w*A_core*1e-6/I_max*I_rms;
else 
    N=k_cu*A_w/required_A_cu;
    if a==0 
        
       disp(N); 
       a=a+1;
    end
end

end
%% Al calculation 0079894A7

AT=linspace(0,1000,1000);



