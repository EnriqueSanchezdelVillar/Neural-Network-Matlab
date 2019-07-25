% limpieza
clear all;
clc;

for ii = 3: 6
 load(['/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/datos' num2str(ii) '.mat']) 
end

% juntar cells
total_cells=cell(1296,1);

total_cells=[C3;C4;C5;C6];



% juntar etiquetas
total_etiquetas=[etiquetas3;etiquetas4;etiquetas5;etiquetas6];

% save solo la cell y los labels

save('datos_tot_raw_s_resh.mat','total_etiquetas','total_cells','C3','C4','C5','C6','etiquetas3','etiquetas4','etiquetas5','etiquetas6');



