function plotaCasoSonico(gama,krmax,kzmin,kzmax,Nlinhas,Npontos)
  
  C = geraCs(gama,krmax,kzmin,kzmax,Nlinhas);
  [n,m] = size(C);
  
  for k = 1:(n*m)
    disp(strcat('/\/\_~~~~~ Calculando linha para C = ',num2str(C(k))));
    plotaLinhasFluxo1V2(kzmin,kzmax,krmax,Npontos,gama,C(k)); hold on;
    if mod(k,10)==0
      percentual_concluido = 100*k/(n*m);
      percentual_concluido = num2str(round(10*percentual_concluido)/10);
      disp(strcat(percentual_concluido,'% CONCLUÍDO'));
    end   
  end
  
  
  titulo = 'Sonic case with gamma = ';
  titulo = strcat(titulo,num2str(gama));
  title(titulo);
  
  q =1;
    
endfunction
