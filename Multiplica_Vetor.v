/*UNIVERSIDADE FEDERAL DA FRONTEIRA SUL
 PROFESSOR: EMILIO WUERGES
 ALUNO: FELIPE AUGUSTO DA SILVA
 EMAIL: felipeaugustosilva94@gmail.com
 DESENVOLVIDO NO AMBIENTE LINUX */

/*TRABALHO 4 - SINAL VERILOG*/


module multv(
  input CLOCK,
  input [9:0] m,
  input [9:0] p,
  output [21:0] o);



  wire [19:0] A;
  wire [21:0] B;
  wire [21:0] S;

  reg [21:0] rg = 0;


  assign A = m * p;
  assign S = A + B;

  assign B = rg;
  assign o = rg;

  always @(posedge CLOCK ) begin
    rg <= S;

  end



endmodule

module test:

  reg [9:0] m;
  reg [9:0] p;
  reg clim = 0;
  wire [21:0] o;

  multv m1(CLOCK,m , p, o);

  always #2 CLOCK <= ~CLOCK;

  initial begin

    $dumpvars;

    m <= 3;
    p <= 6;

    #4;

    m <= 4;
    p <= 7;

    #4;

    m <= 5;
    p <= 8;

    #4
    $finish
  end

endmodule
