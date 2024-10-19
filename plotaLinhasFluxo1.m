function q = plotaLinhasFluxo1(kzmin,kzmax,krmax,N,gama)
 %plota caso sônico - equação (28) do artigo 'Axysimetric flow' Francisco/R.S.Camargo - 
 
 %Entradas: N é o número de pontos a plotar. Nem kzmin, nem gama podem ser zero
 %Saídas: coordenadas (r,z) dos pontos - r pode ter 3 valores para alguns z , por isso pode ter parte real e imaginária
 
 f1 = @(kr,kz,gam) (  ( (0.5*kr/gam).^2.*(2*kr/gam - 1) ) + log(abs(sin(kz)))/gam^2   );
 
 kz0 = (kzmin+kzmax)/2 ;
 kr0 = gama;
 
 C = f1(kr0,kz0,gama);

 %f2 = @(kr,kz) (    f1(kr,kz,gama) - C    );
 
  dkz = ( kzmax - kzmin )/N ;
  dkr = ( krmax - kr0 )/N ;
  
  kr = NaN(1,length(kzmin:dkz:kzmax));
  
  cont = 1;
  cont_sem_solucao = 0;
  
  for kz = kzmin:dkz:kzmax

      C2 = 4*( C - log(abs(sin(kz)))/gama^2 );
      
      f3 = @(x) (  (x.^2).*(2*log(x)-1)   ); %1º termo de f1 fazendo kr/gam = x
      
      F = @(x) ( f3(x) - C2 );
      
      xmin = 1; % xmin = kr0/gama e kr0 = gama;
      xmax = krmax/gama;
      dx = (xmax-xmin)/N ;
      x_vetor = (kr0/gama):dx:(krmax/gama) ;
      i = find(x_vetor==min(x_vetor));
      x0 = x_vetor(i); %palpite inicial sobre o minimo de f3
      xmin = fminsearch(f3,x0);
      
      if C2<f3(xmin)
        disp('Não há linha de fluxo para kz = ');disp(kz);
        cont_sem_solucao = cont_sem_solucao + 1;
      else
        if C2>=f3(xmin) && C2<0 %caso em que tem duas soluções
            x01 = xmin - dx;
            kr(cont) = gama*fzero(F,x01);
            x02 = xmin + dx; 
            kr(cont) = kr(cont) + i*gama*fzero(F,x02); %segunda vai p/ parte imaginária
        else
            df_dx = mean(diff(f3(x_vetor))./dx);
            x0 = C2/df_dx;
            if x0>xmax
              x0 = xmax;
            end
            kr(cont) = gama*fzero(F,x0);
        end
        cont = cont + 1;
      end      

  end      
 
 kz = kzmin:dkz:kzmax;
 
 figure();
 plot(real(kr),kz,'g'); hold on; plot(imag(kr),kz,'g'); hold on;
 plot(-real(kr),kz,'g'); hold on; plot(-imag(kr),kz,'g'); grid on;
 xlabel('kr'); ylabel('kz'); 
 titulo = strcat('Flux lines - subsonic mode with C = ',num2str(C));
 title(titulo);
 
 percentual_pontos_sem_solucao = num2str(100*cont_sem_solucao/(N+1));
 aviso_percentual_pontos_sem_solucao = strcat(percentual_pontos_sem_solucao,'% dos pontos sem solução para este problema');
 disp(aviso_percentual_pontos_sem_solucao);

 size(kz');
 
 q = [conj(kr') kz'];
  
  
endfunction
