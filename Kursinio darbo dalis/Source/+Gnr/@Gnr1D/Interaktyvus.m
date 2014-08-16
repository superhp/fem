function Interaktyvus(g1d, x, y)

figure('WindowButtonDownFcn',@wbdcb)
ah = axes('DrawMode','fast');
axis ([0 x 0 y]);

%duomenys
nr = 0;  

   function wbdcb(src, evnt)     
      nr = nr + 1;
      if strcmp(get(src,'SelectionType'),'normal')            
         [x,y,str] = disp_point(ah);
         g1d.N = [g1d.N; [x y 0]];              %duomenu irasymas 
         g1d.E = [g1d.E; [1 1]];              %labai kvaila
         hl = line('XData',x,'YData',y,'Marker','o');
         text(x,y,str,'VerticalAlignment','bottom');drawnow
         set(src,'WindowButtonMotionFcn',@wbmcb)         
      elseif strcmp(get(src,'SelectionType'),'alt')
         set(src,'WindowButtonMotionFcn','')
         [x,y,str] = disp_point(ah);
         g1d.N = [g1d.N; [x y 0]];              %duomenu irasymas        
         text(x,y,str,'VerticalAlignment','bottom');drawnow
         
         g1d.Irasyti;
      end
      
      function wbmcb(src, evnt)         
         [xn,yn,str] = disp_point(ah);
         xdat = [x,xn];
         ydat = [y,yn];
         set(hl,'XData',xdat,'YData',ydat);           
      end  
   end

   function [x,y,str] = disp_point(ah)
      cp = get(ah,'CurrentPoint');  
      x = cp(1,1);
      y = cp(1,2);  
      str = num2str(nr);      
   end
end