%%%Gabriel R. A. Silva - 10th July 2021%%%
%%% gabriel.silva@aluno.ufabc.edu.br   %%%
%%% unnolab777@gmail.com               %%%

function q = plotStreamLinesV5(kzmin,kzmax,krmin,krmax,gama,Npoints,Nlines) 
%%%V5: the same as V3 but with quiver() function for ploting the velocities
%%%field
%%%V4: the same as V3 but without autosave, to make multiplots with the
%%%suplot function

%%%V3: using krmin and gama as inputs, ouput: only one plot at each time, according gamma. Example if(gamma==1){ plot sonic case }
%%%    Input gama is the Lorentz factor 1/sqrt|1-beta^2| with beta = vph/vs

%%%V2: separated plot for each case

kz = linspace(kzmin,kzmax,Npoints);
kr = linspace(krmin,krmax,Npoints);

[KR,KZ] = meshgrid(kr,kz);

h = figure();

%choosing a streamline function C = F(kr,kz)
if gama<1
    F = @(kr,kz)  log( abs( (kr/gama).*besseli(1,kr/gama) ) ) + log( abs(sin(kz)) )  ;  %equation (21) from paper
    titl = 'subsonic case with gama = '; gama_ = num2str(round(1000*gama)/1000);
    VR = @(kr,kz) besseli(1,kr/gama).*cos(kz)/gama; VZ = @(kr,kz) -besseli(0,kr/gama).*sin(kz); %equations (19)
else
  if gama==1
        gama = krmin;
        F = @(kr,kz)  0.5*(kr/gama).^2.*( log(kr/gama) - 0.5 ) + log( abs(sin(kz)) ) ; %equation (28) from paper
        titl = 'sonic case with gama = '; gama_ = '1';
        VR = @(kr,kz) cos(kz)./kr; VZ = @(kr,kz) -log(kr/gama).*sin(kz);    %equations (25)

  else
      if gama>1
         F = @(kr,kz)  -log( abs( (kr/gama).*besselj(1,kr/gama) ) )  + log( abs(sin(kz)) ); %equation (36) from paper
         titl = 'super sonic case with gama = '; gama_ = num2str(round(1000*gama)/1000);
         VR = @(kr,kz) -besselj(1,kr/gama).*cos(kz)/gama; VZ = @(kr,kz) -besseli(0,kr/gama).*sin(kz); %equations (34)
      else
          error('Wrong input for gama value');
      end
  end
end


%making the plot

F1 = F(KR,KZ); dkr = mean(diff(kr)); dkz = mean(diff(kz));
contour(KR,KZ,F1,Nlines); hold on; contour(-KR,KZ,F1,Nlines); %plotting with mirrors across each axis
contour(-KR,-KZ,F1,Nlines); contour(KR,-KZ,F1,Nlines); %for simetry visulization

n = floor(Npoints/100); kz = linspace(kzmin,kzmax,n); kr = linspace(krmin,krmax,n); 
[KR,KZ] = meshgrid(kr,kz); %F = F(KR,KZ); 
dkr = mean(diff(kr)); dkz = mean(diff(kz));
%[VR,VZ] = gradient(F,dkr,dkz); %would work for electrical equipotential
%lines, but it doesn't work here because the field is not perpendicular to these
% lines but tangent - that is, BETTER USE FORMULAS (19), (25) and (34) of the
% article (only real parts from these complex functions computed here)

quiver(KR,KZ,VR(KR,KZ),VZ(KR,KZ),'color',[0 0 0]); quiver(-KR,KZ,-VR(KR,KZ),VZ(KR,KZ),'color',[0 0 0]);
quiver(-KR,-KZ,-VR(KR,KZ),-VZ(KR,KZ),'color',[0 0 0]); quiver(KR,-KZ,VR(KR,KZ),-VZ(KR,KZ),'color',[0 0 0]);

titl = strcat(titl,gama_); title(titl);
colorbar(); xlabel('kr'); ylabel('kz'); grid on; 
autosave(h,'plotStreamLinesV5 v field over',gama);

q = 1;

end