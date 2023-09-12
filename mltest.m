try 
   fclose(instrfind); 
end; 
s1 = serial('COM3', ... % Change as needed! 
            'BaudRate', 115200, ... 
            'Parity', 'none', ...  
            'DataBits', 8, ... 
            'StopBits', 1, ... 
            'FlowControl', 'none'); 
fopen(s1); 
x = 1:100;
y = x*0;
hLine = plot(x,y);
stripchart('Initialize',gca)

try 
   fprintf('Press CTRL+C to finish\n'); 
   while (1) 
      val=fscanf(s1); 
      result = sscanf(val, '%f'); 
      stripchart('Update',hLine,result)
      fprintf('T=%5.2fC\n', result); 
      ylim([0 inf])
      xlim([0 inf])
      title("Temperature vs Time")
      xlabel('Time')
      ylabel('Temperature')
   end 
end 
fclose(s1); 
