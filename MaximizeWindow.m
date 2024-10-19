function q=MaximizeWindow()
 % criando janela de figura maximizada 
 screen=get(0,'screensize');
 offset1=34;
 offset2=111;
 screen=get(0,'screensize');
 set(gcf,'units','pixels','Position',...
 [1 offset1 screen(3) screen(4)-offset2])

 q = 1;
 
 end