function q = plotaLinhasFluxo1V3(kzmin,kzmax,krmax,Npontos,gama,C,cor)
 
 %V3: associa cor a linha
 
 %V2: usa C como par�metro de entrada
  
 %plota caso s�nico - equa��o (28) do artigo 'Axysimetric flow' Francisco/R.S.Camargo - 
 
 %Entradas: N � o n�mero de pontos a plotar. Nem kzmin, nem gama podem ser zero
 %Sa�das: coordenadas (r,z) dos pontos - r pode ter 3 valores para alguns z , por isso pode ter parte real e imagin�ria
 
 %f1 = @(kr,kz,gam) (  ( (0.5*kr/gam).^2.*(2*kr/gam - 1) ) + log(abs(sin(kz)))/gam^2   );
 
 kz0 = (kzmin+kzmax)/2 ;
 kr0 = gama;
 
% C = f1(kr0,kz0,gama);

 %f2 = @(kr,kz) (    f1(kr,kz,gama) - C    );
 
  dkz = ( kzmax - kzmin )/Npontos ;
  dkr = ( krmax - kr0 )/Npontos ;
  
  kr = NaN(1,length(kzmin:dkz:kzmax));
  
  cont = 1;
  cont_sem_solucao = 0;
  
  for kz = kzmin:dkz:kzmax

      C2 = 4*( C - log(abs(sin(kz)))/gama^2 );
      
      f3 = @(x) (  (x.^2).*(2*log(x)-1)   ); %1� termo de f1 fazendo kr/gam = x
      
      F = @(x) ( f3(x) - C2 );
      
      xmin = 1; % xmin = kr0/gama e kr0 = gama;
      xmax = krmax/gama;
      dx = (xmax-xmin)/Npontos ;
      x_vetor = (kr0/gama):dx:(krmax/gama) ;
      i = find(x_vetor==min(x_vetor));
      x0 = x_vetor(i); %palpite inicial sobre o minimo de f3
      xmin = fminsearch(f3,x0);
      
      df_dx = mean(diff(f3(x_vetor))./dx);
      
      i0 = find(diff(sign(F(x_vetor)))~=0);
      
      %if ~isempty(i0)
      %  x0 = ( x_vetor(i0) + x_vetor(i0+1) )/2 ;
      %else
      %  x0 = C2/df_dx;
      %end
      
      if isempty(i0)
      %if C2<f3(xmin) || x0>5*xmax
        disp('N�o h� linha de fluxo para kz = ');disp(kz);
        cont_sem_solucao = cont_sem_solucao + 1;
      else
        if C2>=f3(xmin) && C2<0 %caso em que tem duas solu��es
            x01 = xmin - dx;
            kr(cont) = gama*fzero(F,x01);
            x02 = xmin + dx; 
            kr(cont) = kr(cont) + i*gama*fzero(F,x02); %segunda vai p/ parte imagin�ria
        else
%            df_dx = mean(diff(f3(x_vetor))./dx);
%            x0 = C2/df_dx;
            x0 = ( x_vetor(i0) + x_vetor(i0+1) )/2 ;
            if x0>xmax
                 x0 = xmax;
            end
            disp( 'x0 = '); disp(x0)
            kr(cont) = gama*fzero(F,x0);
        end
        cont = cont + 1;
      end      

  end      
 
 kz = kzmin:dkz:kzmax;
 
 %figure();
 plot(real(kr),kz,cor); hold on; plot(imag(kr),kz,cor); hold on;
 plot(-real(kr),kz,cor); hold on; plot(-imag(kr),kz,cor); grid on;
 xlabel('kr'); ylabel('kz'); 
 titulo = strcat('Flux line - sonic mode with C = ',num2str(C));
 title(titulo);
 
 percentual_pontos_sem_solucao = num2str(100*cont_sem_solucao/(Npontos+1));
 aviso_percentual_pontos_sem_solucao = strcat(percentual_pontos_sem_solucao,'% dos pontos sem solu��o para este problema');
 disp(aviso_percentual_pontos_sem_solucao);

 size(kz');
 
 q = [conj(kr') kz'];
  
  
end
