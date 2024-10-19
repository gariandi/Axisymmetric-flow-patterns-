function q = geraCs(gama,krmax,kzmin,kzmax,Nlinhas)
  
  %%obs: intervalo de kz não pode passar pelo zero
  
  n = floor(sqrt(Nlinhas));
  
  kz = linspace(kzmin,kzmax,n);
  kr = linspace(gama,krmax,n);
  
  [KR,KZ] = meshgrid(kr,kz);
  
  C = @(kr,kz) (  ( (0.5*kr/gama).^2.*(2*kr/gama - 1) ) + log(abs(sin(kz)))/gama^2   );

  Cs = C(KR,KZ);  
  
  q = Cs;
  
end
