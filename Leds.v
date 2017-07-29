/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMILIO WUERGES
 ALUNO: FELIPE AUGUSTO DA SILVA
 EMAIL: felipeaugustosilva94@gmail.com
 DESENVOLVIDO NO AMBIENTE LINUX */

/*TRABALHO 1 - PISCA-PISCA USANDO VERILOG*/

module piscaluz (
	input clk,
	output pis);

	assign pis = clk;

endmodule

module test(output v);

	reg clk;
	always #2 clk <= ~clk;

	wire pis;
	piscaluz P(clk, pis);

	initial begin
		$dumpvars(0, P);
		#1;
		clk <= 0;
		#500;
		$finish;
	end
endmodule
