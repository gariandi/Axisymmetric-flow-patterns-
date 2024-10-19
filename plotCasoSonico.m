kmax = 2; kzmin = 0.01; kzmax =  1;
Nlinhas = 100; Npontos =  1000;

H = figure(); 

subplot(2,4,1);

plotaCasoSonico(0.01,krmax,kzmin,kzmax,Nlinhas,Npontos);

subplot(2,4,2);

plotaCasoSonico(0.1,krmax,kzmin,kzmax,Nlinhas,Npontos);

subplot(2,4,3);

plotaCasoSonico(0.25,krmax,kzmin,kzmax,Nlinhas,Npontos);

subplot(2,4,4);

plotaCasoSonico(0.50,krmax,kzmin,kzmax,Nlinhas,Npontos);

subplot(2,4,5);

plotaCasoSonico(0.8,krmax,kzmin,kzmax,Nlinhas,Npontos);

subplot(2,4,6);

plotaCasoSonico(1,krmax,kzmin,kzmax,Nlinhas,Npontos);

subplot(2,4,7);

plotaCasoSonico(1.2,krmax,kzmin,kzmax,Nlinhas,Npontos);

subplot(2,4,8);

plotaCasoSonico(1.5,krmax,kzmin,kzmax,Nlinhas,Npontos);

%%salvamento automático
    MaximizeWindow(); pause(2);
    data = date(); hora = clock(); hora = hora(4:end);
    hora1 = num2str(hora(1)); hora2 = num2str(hora(2)); hora3 = num2str(hora(3));
    i_pto = strfind(hora3,'.'); hora3 = hora3(1:(i_pto-1));
    data_hora = strcat(data,' ',hora1,'h',hora2,'min',hora3,'s');
    nome = strcat('plotCasoSonico ',data_hora);
    saveas(H,nome,'png');
%%%%