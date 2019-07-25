%limpia de todo

clear all;
clc;

% inizialización de Matriz con todos los valores de las ondas 
InDet_Tot_6=[];

% número de archivos .mat en la carpeta
folder= '/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Scenario_6';
directorio_files=dir([folder '/*.mat']);
n_files=length(directorio_files);

% array para meter la suma aritmética del numero de valores por cada onda
% por orden 
a=zeros(n_files:2);
bloques=zeros(n_files,1);

% Carga de las n_files ondas. Adjuntadas por orden en la Matriz InDet_Tot

for ii = 1: n_files
 load(['/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Scenario_6/SCENARIO 6.' num2str(ii) '.mat'],'InDet')
    
    InDet_Tot_6=[InDet_Tot_6; InDet];
    s=size(InDet);
    a=[a;s];
       
end

save('In6.mat','InDet_Tot_6');



