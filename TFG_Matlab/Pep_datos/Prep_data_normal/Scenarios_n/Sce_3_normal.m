%limpia de todo

clear all;
clc;

% inizialización de Matriz con todos los valores de las ondas 
InDet_Tot_n=[];

% direccion de los datos
direc_folder='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Scenario_3';
direc_data= '/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Scenario_3/SCENARIO 3.';

% número de archivos .mat en la carpeta
yourfolder = direc_folder;
directorio_files=dir([yourfolder '/*.mat']);
n_files=length(directorio_files);

% array para meter la suma aritmética del numero de valores por cada onda
% por orden 
a=zeros(n_files:2);
bloques=zeros(n_files,1);

% Carga de las n_files ondas. Adjuntadas por orden en la Matriz InDet_Tot

for ii = 1: n_files
 load([direc_data num2str(ii) ' v2.mat'],'InDet')
    InDet_n= normalize(InDet);
    InDet_Tot_n=[InDet_Tot_n; InDet_n];
    s=size(InDet_n);
    a=[a;s];
       
end

% inicialización de constantes 

long=size(InDet_Tot_n);
rows=long(1);
columns=long(2);
columns_cell=columns*n_files;

% inicialización de la celda donde iran los valores de cada onda 
C3_n=cell(columns,1);

for i=1:n_files
    bloques(n_files+1-i)=sum(a(1:n_files+1-i));
    
end

% añade un 1 al principio para qel loop empiece desde 1
bloques=[1;bloques];
%constante para que las cell tengan dimensión correcta y no de +1 dato
adicion=0;

for j=1:n_files
   
    blk_0=bloques(j);
    blk_1=bloques(j+1);
   
  
    for i=1:columns
    
    C3_n{i+((j-1)*48),1}=InDet_Tot_n((blk_0+adicion):blk_1,i)';
    
    end
    
    adicion=1;
end
  

% creacion de los labels categoricos 
D3=cell(columns,1);

for i=1:columns_cell
   
    D3{i,1}= 'T';
end

% Convertimos la cell D a categorical
etiquetas3 = categorical(D3);

% save solo la cell y los labels

save('datos3_n.mat','etiquetas3','C3_n');
    
