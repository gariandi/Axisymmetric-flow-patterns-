function q = plotStreamLinesV3(kzmin,kzmax,krmin,krmax,gama,Npoints,Nlines) 
%%%V3: using krmin and gama as inputs, ouput: only one plot at each time, according gamma. Example if(gamma==1){ plot sonic case }
%%%    Input gama is the Lorentz factor 1/sqrt|1-beta^2| with beta = vph/vs

%%%V2: separated plot for each case
%%%Gabriel R. A. Silva - 10th July 2021%%%
%%% gabriel.silva@aluno.ufabc.edu.br   %%%
%%% unnolab777@gmail.com               %%%

kz = linspace(kzmin,kzmax,Npoints);
kr = linspace(krmin,krmax,Npoints);

[KR,KZ] = meshgrid(kr,kz);

h = figure(); 

%choosing a streamline function C = F(kr,kz)
if gama<1
    F = @(kr,kz)  log( abs( (kr/gama).*besseli(1,kr/gama) ) ) + log( abs(sin(kz)) )  ;  %equation (21) from paper
    titl = 'subsonic case with gama = '; gama_ = num2str(round(1000*gama)/1000);
else
  if gama==1
        gama = krmin;
        F = @(kr,kz)  0.5*(kr/gama).^2.*( log(kr/gama) - 0.5 ) + log( abs(sin(kz)) ) ; %equation (28) from paper
        titl = 'sonic case with gama = '; gama_ = '1';
  else
      if gama>1
         F = @(kr,kz)  -log( abs( (kr/gama).*besselj(1,kr/gama) ) )  + log( abs(sin(kz)) ); %equation (36) from paper
         titl = 'super sonic case with gama = '; gama_ = num2str(round(1000*gama)/1000);
      else
          error('Wrong input for gama value');
      end
  end
end

%making the plot
contour(KR,KZ,F(KR,KZ),Nlines); hold on; contour(-KR,KZ,F(KR,KZ),Nlines); hold on; %plotting with mirrors across each axis
contour(-KR,-KZ,F(KR,KZ),Nlines); hold on;  contour(KR,-KZ,F(KR,KZ),Nlines); hold on; %for simetry visulization
titl = strcat(titl,gama_); title(titl);
colorbar(); xlabel('kr'); ylabel('kz'); grid on; 
autosave(h,'plotStreamLinesV3',gama);

q = 1;

end