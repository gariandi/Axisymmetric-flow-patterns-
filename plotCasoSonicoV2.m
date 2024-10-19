%10-07-2021
%sonic case plots reconstruction from email sent to professor Francisco in June, 22th, 2021 

kmax = 2; kzmin = 0.01; kzmax =  1;
Nlinhas = 100; Npontos =  1000;

H = figure(); 

subplot(2,4,1);

plotStreamLinesV4(kzmin,kzmax,0.01,krmax,1,Npoints,Nlines) 

subplot(2,4,2);

plotStreamLinesV4(kzmin,kzmax,0.1,krmax,1,Npoints,Nlines) 

subplot(2,4,3);

plotStreamLinesV4(kzmin,kzmax,0.25,krmax,1,Npoints,Nlines) 

subplot(2,4,4);

plotStreamLinesV4(kzmin,kzmax,0.50,krmax,1,Npoints,Nlines) 

subplot(2,4,5);

plotStreamLinesV4(kzmin,kzmax,0.8,krmax,1,Npoints,Nlines) 

subplot(2,4,6);

plotStreamLinesV4(kzmin,kzmax,1,krmax,1,Npoints,Nlines) 


subplot(2,4,7);

plotStreamLinesV4(kzmin,kzmax,1.2,krmax,1,Npoints,Nlines) 

subplot(2,4,8);

plotStreamLinesV4(kzmin,kzmax,1.5,krmax,1,Npoints,Nlines) 

%%salvamento automático
    MaximizeWindow(); pause(2);
    data = date(); hora = clock(); hora = hora(4:end);
    hora1 = num2str(hora(1)); hora2 = num2str(hora(2)); hora3 = num2str(hora(3));
    i_pto = strfind(hora3,'.'); hora3 = hora3(1:(i_pto-1));
    data_hora = strcat(data,' ',hora1,'h',hora2,'min',hora3,'s');
    nome = strcat('plotCasoSonico Reconstrução ',data_hora);
    saveas(H,nome,'png');
%%%%