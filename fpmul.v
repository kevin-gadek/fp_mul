
module fpmul(
    input wire Clk,
    input wire Rst,
    input wire Start,
    input wire [31:0] A,
    input wire [31:0] B,
    output wire Done,
    output wire [31:0] P,
    output wire UF,
    output wire OF,
    output wire NaNF,
    output wire InfF,
    output wire DNF,
    output wire ZF );
    
    //Control signals
    wire SA_LD;
    wire EA_LD;
    wire MA_LD;
    wire SB_LD;
    wire EB_LD;
    wire MB_LD;
    wire SP_LD;
    wire EP_SET;
    wire EP_RST;
    wire [1:0] EP_SEL;
    wire EP_LD;
    wire MPH_SET;
    wire MPH_RST;
    wire [2:0] MPH_SEL;
    wire MPH_LD;
    wire MPL_SEL;
    wire MPL_LD;
    wire UF_RST;
    wire UF_LD;
    wire OF_RST;
    wire OF_LD;
    wire NAN_LD;
    wire NAN_RST;
    wire INF_LD;
    wire INF_RST;
    wire DNF_RST;
    wire DNF_LD;
    wire ZF_LD;
    wire ZF_RST;
    wire P_LD;
    wire P_RST;
    
    //Status Signals
    wire NaN;
    wire Inf;
    wire Zero;
    wire MAP23;
    wire Round;
    wire Carry;
    wire UFlow;
    wire OFlow;
  /*
  module fpmul_cu (
      input wire clk,
      input wire rst,
      
      input wire Start,
      
      //output ctrl signals to dp
      output reg SA_LD,
      output reg EA_LD,
      output reg MA_LD,
      output reg SB_LD,
      output reg EB_LD,
      output reg MB_LD,
      output reg SP_LD,
      output reg EP_SET, //set to FF, necessary for exit conditions such as if abnormal
      output reg EP_RST, //set to 00
      output reg [1:0] EP_SEL, //at certain points, need to select either ep - 127, ep + 1, or ea + eb inputs
      output reg EP_LD,
      output reg MPH_SET,
      output reg MPH_RST,
      output reg [2:0] MPH_SEL, //sel between MP[47:24], {MPH[22:0], MPL[23]}, MPH + 1, and 0x800000
      output reg MPH_LD,
      output reg MPL_SEL, //sel between MP[23:0] or MPL << 1 for state 5
      output reg MPL_LD,
      output reg UF_RST,
      output reg UF_LD, 
      output reg OF_RST,
      output reg OF_LD,
      output reg NAN_RST,
      output reg NAN_LD,
      output reg INF_RST,
      output reg INF_LD,
      output reg DNF_RST,
      output reg DNF_LD,
      output reg ZF_RST,
      output reg ZF_LD,
      output reg P_RST,
      output reg P_LD,
      
      //status signals
      input wire NaN,
      input wire Inf,
      input wire Zero, 
      input wire MPH23,
      input wire Round,
      input wire UFlow,
      input wire OFlow,
      
      //top-level outputs
      output reg Done
  
  */  
    //fpmul_cu cu
    fpmul_cu cu (
    .clk(Clk),
    .rst(Rst),
    .Start(Start),
    .SA_LD(SA_LD),
    .EA_LD(EA_LD),
    .MA_LD(MA_LD),
    .SB_LD(SB_LD),
    .EB_LD(EB_LD),
    .MB_LD(MB_LD),
    .SP_LD(SP_LD),
    .EP_SET(EP_SET),
    .EP_RST(EP_RST),
    .EP_SEL(EP_SEL),
    .EP_LD(EP_LD),
    .MPH_SET(MPH_SET),
    .MPH_RST(MPH_RST),
    .MPH_SEL(MPH_SEL),
    .MPH_LD(MPH_LD),
    .MPL_SEL(MPL_SEL),
    .MPL_LD(MPL_LD),
    .UF_RST(UF_RST),
    .UF_LD(UF_LD),
    .OF_RST(OF_RST),
    .OF_LD(OF_LD),  
    .NAN_RST(NAN_RST),
    .NAN_LD(NAN_LD),
    .INF_RST(INF_RST),
    .INF_LD(INF_LD),
    .DNF_RST(DNF_RST),
    .DNF_LD(DNF_LD),
    .ZF_RST(ZF_RST),
    .ZF_LD(ZF_LD),
    .P_RST(P_RST),
    .P_LD(P_LD),
    .NaN(NaN),
    .Inf(Inf),
    .Zero(Zero),
    .MPH23(MPH23),
    .Round(Round),
    .Carry(Carry),
    .UFlow(UFlow),
    .OFlow(OFlow));
    
    //fpmul_dp dp
    fpmul_dp dp ();
endmodule
