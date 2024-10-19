function plotaCasoSonicoV2(gama,krmax,kzmin,kzmax,Nlinhas,Npontos)
  %V2: atribui cor a cada linha e repassa a funcao plotaLinhasFluxoV3
  
  C = geraCs(gama,krmax,kzmin,kzmax,Nlinhas);
  
  Cores = colormap();
  Cmin = min(min(C)); Cmax = max(max(C));
  Cor = ( C - Cmin )/( Cmax - Cmin );
  cor = round( 1 + (64-1)*(C-Cmin)/(Cmax-Cmin) );
  [n,m] = size(C);
  
  
  for k = 1:(n*m)
    disp(strcat('/\/\_~~~~~ Calculando linha para C = ',num2str(C(k))));
    cor = Cor(k);
    plotaLinhasFluxo1V3(kzmin,kzmax,krmax,Npontos,gama,C(k),cor(k)); hold on;
%    if mod(k,10)==0
%      percentual_concluido = 100*k/(n*m);
%      percentual_concluido = num2str(round(10*percentual_concluido)/10);
%      disp(strcat(percentual_concluido,'% CONCLUÍDO'));
%    end   
  end
  
  
  titulo = 'Sonic case with gamma = ';
  titulo = strcat(titulo,num2str(gama));
  title(titulo);
  
  q =1;
    
end
