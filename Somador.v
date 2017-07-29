/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMILIO WUERGES
 ALUNO: FELIPE AUGUSTO DA SILVA
 EMAIL: felipeaugustosilva94@gmail.com
 DESENVOLVIDO NO AMBIENTE LINUX */

/*TRABALHO 8 - SOMADOR VERILOG*/

module Soma(input clk,
	input [63:0] N_1,
	input [63:0] N_2,
	output[63:0] S_1
	);
reg [63:0] S;
assign S_1 = S;
always @(posedge clk) begin
	S <= N_1 + N_2;
end
endmodule
module test;
	reg clk;
	reg[63:0] N_1, N_2;
	wire[63:0] S_1;
	always #2 clk = ~clk;
	Soma A(clk, N_1, N_2, S_1);
	initial begin
		$dumpvars(0, A);

#0 clk <= 0;
N_1 <= 4;
N_2 <= 6;

#20
N_1 <= 13;
N_2 <= 50;

#40
N_1 <= 4;
N_2 <= 7;

#50;
N_1 <= 49;
N_2 <= 74;

#500;

$finish;
end
endmodule
