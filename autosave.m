%%%Gabriel R. A. Silva - 10th July 2021%%%
%%% gabriel.silva@aluno.ufabc.edu.br   %%%
%%% unnolab777@gmail.com               %%%

function q = autosave(H,titl,gama)
%%automatic saving full screen handle graphics H with name titl + date and time of
%%creation

    MaximizeWindow(); pause(2);
    data = date(); hora = clock(); hora = hora(4:end);
    hora1 = num2str(hora(1)); hora2 = num2str(hora(2)); hora3 = num2str(hora(3));
    i_pto = strfind(hora3,'.'); hora3 = hora3(1:(i_pto-1));
    data_hora = strcat(data,' ',hora1,'h',hora2,'min',hora3,'s');
    gama = strrep(num2str(gama),'.','_');
    gama = strcat(' - gama ',gama);
    nome = strcat(titl,data_hora,gama);
    saveas(H,nome,'png');

%%%%

q = 1;

end