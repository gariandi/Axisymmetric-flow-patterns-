function q = plotStreamLinesV2(kzmin,kzmax,gama,krmax,Npoints,Nlines) 
%%%V2: separated plot for each case

%%%Gabriel R. A. Silva - 10th July 2021%%%
%%% gabriel.silva@aluno.ufabc.edu.br   %%%
%%% unnolab777@gmail.com               %%%


%streamline functions
Fsubsonic = @(kr,kz)  log( abs( (kr/gama).*besseli(1,kr/gama) ) ) + log( abs(sin(kz)) )  ; 
Fsonic = @(kr,kz)  0.5*(kr/gama).^2.*( log(kr/gama) - 0.5 ) + log( abs(sin(kz)) ) ;
Fsupersonic = @(kr,kz)  -log( abs( (kr/gama).*besselj(1,kr/gama) ) )  + log( abs(sin(kz)) );

kz = linspace(kzmin,kzmax,Npoints);
kr = linspace(gama,krmax,Npoints);

[KR,KZ] = meshgrid(kr,kz);

h = figure(); 
contour(KR,KZ,Fsubsonic(KR,KZ),Nlines); xlabel('kr'); ylabel('kz'); 
title('subsonic case'); colorbar(); autosave(h,'StreamLines subsonic',gama);
h = figure(); 
subplot(1,3,2); contour(KR,KZ,Fsonic(KR,KZ),Nlines); xlabel('kr'); ylabel('kz');
title('sonic case'); colorbar(); autosave(h,'StreamLines sonic',gama);
h = figure();
subplot(1,3,3); contour(KR,KZ,Fsupersonic(KR,KZ),Nlines); xlabel('kr'); ylabel('kz');
title('super sonic case'); colorbar();  autosave(h,'StreamLines super sonic',gama);


q = 1;

end