/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMILIO WUERGES
 ALUNO: FELIPE AUGUSTO DA SILVA
 EMAIL: felipeaugustosilva94@gmail.com
 DESENVOLVIDO NO AMBIENTE LINUX */

/*TRABALHO 2 - APLICAÇÃO DO TRABALHO 1 NA PLACA DE FPGA*/

module contador(
	input CLOCK_50,
	output [0:0] LEDG);

	reg light = 0;
	reg [25:0] count;
	assign LEDG = light;

	always @(posedge CLOCK_50) begin
		if(count == 50000000) begin
			light <= ~light;
			count <= 0;
		end else begin
			count <= count+1;
		end
	end
endmodule

module teste;
	reg CLOCK_50;
	reg KEY;
	wire light;

	always #1 CLOCK_50 <= ~CLOCK_50;

  contador C(CLOCK_50, light);

	initial begin
	$dumpvars(0, C);
	#0
	KEY <= 1;
	CLOCK_50 <= 0;
	#1
	KEY <= 0;
	#5000
	$finish;
	end
endmodule
