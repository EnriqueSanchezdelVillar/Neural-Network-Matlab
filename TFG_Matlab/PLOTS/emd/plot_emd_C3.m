clear all
% load
direc='/Volumes/TOSHIBA/Señales suizos tercero, cuarto, quinto y sexto escenario/Datos/Datos_raw/datos3.mat';
load(direc);


% a=C3{1};
% b=C3{49};
 c=C3{97};
% d=C3{145};
% e=C3{193};
% f=C3{241};


emd(c,'Interpolation','pchip');