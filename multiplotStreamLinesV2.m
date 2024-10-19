%%%Gabriel R. A. Silva - 10th July 2021%%%
%%% gabriel.silva@aluno.ufabc.edu.br   %%%
%%% unnolab777@gmail.com               %%%

%%%Visualizing flux patterns for diferent gammas (Lorentz factors), from
%%%gamamin to gamamax
function q = multiplotStreamLinesV2(kzmin,kzmax,krmin0,krmin1,krmax,Npoints,Nlines,Nplots)

 fib = (1+sqrt(5))/2; %fibonacci number helps to find better lines and columns for filling the screen
% Nplots = lines.columns and columns = fib.lines => fib.lines^2 = Nplots =>
lines = floor( sqrt(Nplots/fib) ) ; columns = round( sqrt(fib*Nplots) );

krmin = linspace(krmin0,krmin1,Nplots);
h = figure();

 for k = 1:Nplots
     subplot(lines,columns,k); 
     plotStreamLinesV4(kzmin,kzmax,krmin(k),krmax,1,Npoints,Nlines);
     titl = 'sonic case with gamma = '; krmin_ = num2str(krmin(k));
     title(strcat(titl,krmin_));
 end

krmins = [krmin0 krmin1];
titl = strcat('multiplotStreamLinesV2 sonic case (gama 1) varianting krmin ',num2str(Nplots),'plots');
autosaveV2(h,titl,krmins);

q = 1;

end