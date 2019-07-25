% clean
clear all;
clc;

% load
directorio1='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos3_n.mat';
load(directorio1,'C3_n');

directorio2='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos4_n.mat';
load(directorio2,'C4_n');

directorio3='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos5_n.mat';
load(directorio3,'C5_n');

directorio4='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos6_n.mat';
load(directorio4,'C6_n');



% C3_n

a_3=xcorr(C3_n{46},150); 
b_3=xcorr(C3_n{90},150); 
c_3=xcorr(C3_n{143},150); 
d_3=xcorr(C3_n{192},150); 

% C4_n

a_4=xcorr(C4_n{46},150); 
b_4=xcorr(C4_n{90},150); 
c_4=xcorr(C4_n{143},150); 
d_4=xcorr(C4_n{190},150); 
e_4=xcorr(C4_n{220},150); 
f_4=xcorr(C4_n{280},150); 
g_4=xcorr(C4_n{330},150); 
h_4=xcorr(C4_n{380},150); 
i_4=xcorr(C4_n{431},150); 


% C5_n

a_5=xcorr(C5_n{46},150); 
b_5=xcorr(C5_n{90},150); 
c_5=xcorr(C5_n{143},150); 
d_5=xcorr(C5_n{192},150); 

% C6_n

a_6=xcorr(C6_n{46},150); 
b_6=xcorr(C6_n{90},150); 
c_6=xcorr(C6_n{143},150); 
d_6=xcorr(C6_n{192},150); 







