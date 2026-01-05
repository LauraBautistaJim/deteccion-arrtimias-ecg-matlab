clc; clear; close all;


registro = '111';      
Fs = 360;              

fid = fopen([registro '.dat'],'r');
if fid == -1
    error('No se pudo abrir el archivo .dat');
end

A = fread(fid,[2 inf],'int16');
fclose(fid);

ecg = double(A(1,:));
ecg = ecg - mean(ecg); 

t = (0:length(ecg)-1)/Fs;


[b,a] = butter(3,[5 15]/(Fs/2),'bandpass');
ecg_filt = filtfilt(b,a,ecg);


[~,locs] = findpeaks(ecg_filt,...
    'MinPeakHeight',0.5*max(ecg_filt),...
    'MinPeakDistance',0.6*Fs);


RR = diff(locs)/Fs;       
FC = 60./RR;              

FC_prom = mean(FC);

bradicardia = FC < 60;
taquicardia = FC > 100;

fprintf('Frecuencia cardiaca promedio: %.2f bpm\n', FC_prom);
fprintf('Bradicardia detectada: %d eventos\n', sum(bradicardia));
fprintf('Taquicardia detectada: %d eventos\n', sum(taquicardia));


figure
plot(t, ecg_filt,'b')
hold on
plot(t(locs), ecg_filt(locs),'ro','MarkerSize',4)
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Detección de QRS – Registro 100 MIT-BIH (Completo)')
legend('ECG filtrado','QRS')
grid on


ventana_ini = 100;  
ventana_fin = 110;  

idx = t >= ventana_ini & t <= ventana_fin;

figure
plot(t(idx), ecg_filt(idx),'b','LineWidth',1.2)
hold on
qrs_win = locs(t(locs)>=ventana_ini & t(locs)<=ventana_fin);
plot(t(qrs_win), ecg_filt(qrs_win),'ro','MarkerSize',6)
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Detección de QRS – Ventana de 10 segundos')
legend('ECG filtrado','QRS')
grid on


figure
histogram(FC,20)
xlabel('Frecuencia cardiaca (bpm)')
ylabel('Número de eventos')
title('Distribución de la Frecuencia Cardiaca')
grid on
