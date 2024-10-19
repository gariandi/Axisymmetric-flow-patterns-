%%%Gabriel R. A. Silva - 10th July 2021%%%
%%% gabriel.silva@aluno.ufabc.edu.br   %%%
%%% unnolab777@gmail.com               %%%

%%%Visualizing flux patterns for diferent gammas (Lorentz factors), from
%%%gamamin to gamamax
function q = multiplotStreamLines(kzmin,kzmax,krmin,krmax,gamamin,gamamax,Npoints,Nlines,Nplots)

 fib = (1+sqrt(5))/2; %fibonacci number helps to find better lines and columns for filling the screen
% Nplots = lines.columns and columns = fib.lines => fib.lines^2 = Nplots =>
lines = floor( sqrt(Nplots/fib) ) ; columns = round( sqrt(fib*Nplots) );

gama = linspace(gamamin,gamamax,Nplots);
h = figure();

 for k = 1:Nplots
     subplot(lines,columns,k); 
     plotStreamLinesV4(kzmin,kzmax,krmin,krmax,gama(k),Npoints,Nlines);
 end

gamas = [gamamin gamamax];
titl = strcat('multiplotStreamLines gamma variating ',num2str(Nplots),'plots');
autosave(h,titl,gamas);

q = 1;

end