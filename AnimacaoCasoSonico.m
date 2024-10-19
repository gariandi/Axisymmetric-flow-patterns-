function q = AnimacaoCasoSonico(gama_min,gama_max,Nquadros,krmax,kzmin,kzmax,Nlinhas,Npontos)
  %20-06-2021
  %Salva quadros para animação das linhas de fluxo aumentando gama na equação (28)
  
  dgama = ( gama_max - gama_min )/(Nquadros - 1);
  cont = 1;
  
  for gama = gama_min:dgama:gama_max
    H = figure();
    plotaCasoSonico(gama,krmax,kzmin,kzmax,Nlinhas,Npontos);
    data = date(); hora = clock(); hora = hora(4:end);
    hora1 = num2str(hora(1)); hora2 = num2str(hora(2)); hora3 = num2str(hora(3));
    i_pto = strfind(hora3,'.'); hora3(i_pto) = '_';
    data_hora = strcat(data,' ',hora1,'h',hora2,'min',hora3,'s');
    nome = strcat('AnimacaoCasoSonico',num2str(cont),' ',data_hora);
    saveas(H,nome,'png');
    close(H);
    cont = cont + 1;
    
    if mod(cont,10)==0
      percentual_concluido = 100*cont/Nquadros;
      percentual_concluido = num2str(round(10*percentual_concluido)/10);
      disp('!!!!!!!!!!!!!!!!!!!!!!!!!!ANIMAÇÃO ',strcat(percentual_concluido,'% CONCLUÍDA!!!!!!!!!!!!!!!!!!!!!!!!!!!'));
    end   
    
  end
    
  q = 1;
  
end
