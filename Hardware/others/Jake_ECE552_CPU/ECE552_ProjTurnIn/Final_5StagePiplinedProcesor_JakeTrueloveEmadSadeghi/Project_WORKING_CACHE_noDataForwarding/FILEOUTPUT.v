module FILEOUTPUT(); 

$display ("Value of variable is %d", var);
integer flag;
initial flag = $fopen ("out_file");
always @(....); // dump data in text file
$fdisplay (flag, ?%h?, data [7: 0]);
 ........
$fclose (?out_file?);
end
$monitor ($time, ?a = %b and b = %b?, clock, reset);
$fmonitor (flag, ?value = %h?, add [15: 0]);
$monitoron;
$monitoroff;

endmodule