% limpieza
clear all;
clc;

for ii = 3: 6
 load(['/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_n/Scenarios_n/datos' num2str(ii) '_n.mat']) 
end

% juntar cells
total_cells_n=cell(1008,1);

total_cells_n=[C3_n;C4_n;C5_n;C6_n];



% juntar etiquetas
total_etiquetas=[etiquetas3;etiquetas4;etiquetas5;etiquetas6];

% save solo la cell y los labels

save('datos_tot_n.mat','total_etiquetas','total_cells_n','C3_n','C4_n','C5_n','C6_n','etiquetas3','etiquetas4','etiquetas5','etiquetas6');
