/*******************/
/* rom8x1024_sim.v */
/*******************/

//                  +----+
//  rom_addr[11:0]->|    |->rom_data[31:0]
//                  +----+

//
// ROMの記述（論理シミュレーション用）
//

module rom8x1024_sim (rom_addr, rom_data);

  input   [11:0]  rom_addr;  // 12-bit アドレス入力ポート
  output  [31:0]  rom_data;  // 32-bit データ出力ポート

  reg     [31:0]  data;

  // Wire
  wire     [9:0]  word_addr; // 10-bit address, word

  assign word_addr = rom_addr[9:2];
   
  always @(word_addr) begin
    case (word_addr)
      10'h000: data = 32'he000001c; // 00400000: other type! opcode=56(10)
      10'h001: data = 32'h00000000; // 00400004: SLL, REG[0]<=REG[0]<<0;
      10'h002: data = 32'h00000000; // 00400008: SLL, REG[0]<=REG[0]<<0;
      10'h003: data = 32'h00000000; // 0040000c: SLL, REG[0]<=REG[0]<<0;
      10'h004: data = 32'h00000000; // 00400010: SLL, REG[0]<=REG[0]<<0;
      10'h005: data = 32'h00408540; // 00400014: SLL, REG[16]<=REG[0]<<21;
      10'h006: data = 32'h00000000; // 00400018: SLL, REG[0]<=REG[0]<<0;
      10'h007: data = 32'h00000000; // 0040001c: SLL, REG[0]<=REG[0]<<0;
      10'h008: data = 32'h27bdffb8; // 00400020: ADDIU, REG[29]<=REG[29]+65464(=0x0000ffb8);
      10'h009: data = 32'hafbf0044; // 00400024: SW, RAM[REG[29]+68]<=REG[31];
      10'h00a: data = 32'hafbe0040; // 00400028: SW, RAM[REG[29]+64]<=REG[30];
      10'h00b: data = 32'h03a0f021; // 0040002c: ADDU, REG[30]<=REG[29]+REG[0];
      10'h00c: data = 32'h27c20014; // 00400030: ADDIU, REG[2]<=REG[30]+20(=0x00000014);
      10'h00d: data = 32'h00402021; // 00400034: ADDU, REG[4]<=REG[2]+REG[0];
      10'h00e: data = 32'h0c100071; // 00400038: JAL, PC<=0x00100071*4(=0x004001c4); REG[31]<=PC+4
      10'h00f: data = 32'h00000000; // 0040003c: SLL, REG[0]<=REG[0]<<0;
      10'h010: data = 32'h8fc30014; // 00400040: LW, REG[3]<=RAM[REG[30]+20];
      10'h011: data = 32'h24020052; // 00400044: ADDIU, REG[2]<=REG[0]+82(=0x00000052);
      10'h012: data = 32'h14620011; // 00400048: BNE, PC<=(REG[3] != REG[2])?PC+4+17*4:PC+4;
      10'h013: data = 32'h00000000; // 0040004c: SLL, REG[0]<=REG[0]<<0;
      10'h014: data = 32'hafc00010; // 00400050: SW, RAM[REG[30]+16]<=REG[0];
      10'h015: data = 32'h0810001d; // 00400054: J, PC<=0x0010001d*4(=0x00400074);
      10'h016: data = 32'h00000000; // 00400058: SLL, REG[0]<=REG[0]<<0;
      10'h017: data = 32'h0c10004e; // 0040005c: JAL, PC<=0x0010004e*4(=0x00400138); REG[31]<=PC+4
      10'h018: data = 32'h00000000; // 00400060: SLL, REG[0]<=REG[0]<<0;
      10'h019: data = 32'h8fc20010; // 00400064: LW, REG[2]<=RAM[REG[30]+16];
      10'h01a: data = 32'h00000000; // 00400068: SLL, REG[0]<=REG[0]<<0;
      10'h01b: data = 32'h24420001; // 0040006c: ADDIU, REG[2]<=REG[2]+1(=0x00000001);
      10'h01c: data = 32'hafc20010; // 00400070: SW, RAM[REG[30]+16]<=REG[2];
      10'h01d: data = 32'h8fc20010; // 00400074: LW, REG[2]<=RAM[REG[30]+16];
      10'h01e: data = 32'h00000000; // 00400078: SLL, REG[0]<=REG[0]<<0;
      10'h01f: data = 32'h2c42000a; // 0040007c: SLTIU, REG[2]<=(REG[2]<10(=0x0000000a))?1:0;
      10'h020: data = 32'h1440fff6; // 00400080: BNE, PC<=(REG[2] != REG[0])?PC+4+65526*4:PC+4;
      10'h021: data = 32'h00000000; // 00400084: SLL, REG[0]<=REG[0]<<0;
      10'h022: data = 32'h0810000c; // 00400088: J, PC<=0x0010000c*4(=0x00400030);
      10'h023: data = 32'h00000000; // 0040008c: SLL, REG[0]<=REG[0]<<0;
      10'h024: data = 32'h8fc30014; // 00400090: LW, REG[3]<=RAM[REG[30]+20];
      10'h025: data = 32'h2402004c; // 00400094: ADDIU, REG[2]<=REG[0]+76(=0x0000004c);
      10'h026: data = 32'h1462ffe5; // 00400098: BNE, PC<=(REG[3] != REG[2])?PC+4+65509*4:PC+4;
      10'h027: data = 32'h00000000; // 0040009c: SLL, REG[0]<=REG[0]<<0;
      10'h028: data = 32'hafc00010; // 004000a0: SW, RAM[REG[30]+16]<=REG[0];
      10'h029: data = 32'h08100031; // 004000a4: J, PC<=0x00100031*4(=0x004000c4);
      10'h02a: data = 32'h00000000; // 004000a8: SLL, REG[0]<=REG[0]<<0;
      10'h02b: data = 32'h0c100038; // 004000ac: JAL, PC<=0x00100038*4(=0x004000e0); REG[31]<=PC+4
      10'h02c: data = 32'h00000000; // 004000b0: SLL, REG[0]<=REG[0]<<0;
      10'h02d: data = 32'h8fc20010; // 004000b4: LW, REG[2]<=RAM[REG[30]+16];
      10'h02e: data = 32'h00000000; // 004000b8: SLL, REG[0]<=REG[0]<<0;
      10'h02f: data = 32'h24420001; // 004000bc: ADDIU, REG[2]<=REG[2]+1(=0x00000001);
      10'h030: data = 32'hafc20010; // 004000c0: SW, RAM[REG[30]+16]<=REG[2];
      10'h031: data = 32'h8fc20010; // 004000c4: LW, REG[2]<=RAM[REG[30]+16];
      10'h032: data = 32'h00000000; // 004000c8: SLL, REG[0]<=REG[0]<<0;
      10'h033: data = 32'h2c42000a; // 004000cc: SLTIU, REG[2]<=(REG[2]<10(=0x0000000a))?1:0;
      10'h034: data = 32'h1440fff6; // 004000d0: BNE, PC<=(REG[2] != REG[0])?PC+4+65526*4:PC+4;
      10'h035: data = 32'h00000000; // 004000d4: SLL, REG[0]<=REG[0]<<0;
      10'h036: data = 32'h0810000c; // 004000d8: J, PC<=0x0010000c*4(=0x00400030);
      10'h037: data = 32'h00000000; // 004000dc: SLL, REG[0]<=REG[0]<<0;
      10'h038: data = 32'h27bdffe8; // 004000e0: ADDIU, REG[29]<=REG[29]+65512(=0x0000ffe8);
      10'h039: data = 32'hafbf0014; // 004000e4: SW, RAM[REG[29]+20]<=REG[31];
      10'h03a: data = 32'hafbe0010; // 004000e8: SW, RAM[REG[29]+16]<=REG[30];
      10'h03b: data = 32'h03a0f021; // 004000ec: ADDU, REG[30]<=REG[29]+REG[0];
      10'h03c: data = 32'h24040001; // 004000f0: ADDIU, REG[4]<=REG[0]+1(=0x00000001);
      10'h03d: data = 32'h0c100064; // 004000f4: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h03e: data = 32'h00000000; // 004000f8: SLL, REG[0]<=REG[0]<<0;
      10'h03f: data = 32'h24040002; // 004000fc: ADDIU, REG[4]<=REG[0]+2(=0x00000002);
      10'h040: data = 32'h0c100064; // 00400100: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h041: data = 32'h00000000; // 00400104: SLL, REG[0]<=REG[0]<<0;
      10'h042: data = 32'h24040004; // 00400108: ADDIU, REG[4]<=REG[0]+4(=0x00000004);
      10'h043: data = 32'h0c100064; // 0040010c: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h044: data = 32'h00000000; // 00400110: SLL, REG[0]<=REG[0]<<0;
      10'h045: data = 32'h24040008; // 00400114: ADDIU, REG[4]<=REG[0]+8(=0x00000008);
      10'h046: data = 32'h0c100064; // 00400118: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h047: data = 32'h00000000; // 0040011c: SLL, REG[0]<=REG[0]<<0;
      10'h048: data = 32'h03c0e821; // 00400120: ADDU, REG[29]<=REG[30]+REG[0];
      10'h049: data = 32'h8fbf0014; // 00400124: LW, REG[31]<=RAM[REG[29]+20];
      10'h04a: data = 32'h8fbe0010; // 00400128: LW, REG[30]<=RAM[REG[29]+16];
      10'h04b: data = 32'h27bd0018; // 0040012c: ADDIU, REG[29]<=REG[29]+24(=0x00000018);
      10'h04c: data = 32'h03e00008; // 00400130: JR, PC<=REG[31];
      10'h04d: data = 32'h00000000; // 00400134: SLL, REG[0]<=REG[0]<<0;
      10'h04e: data = 32'h27bdffe8; // 00400138: ADDIU, REG[29]<=REG[29]+65512(=0x0000ffe8);
      10'h04f: data = 32'hafbf0014; // 0040013c: SW, RAM[REG[29]+20]<=REG[31];
      10'h050: data = 32'hafbe0010; // 00400140: SW, RAM[REG[29]+16]<=REG[30];
      10'h051: data = 32'h03a0f021; // 00400144: ADDU, REG[30]<=REG[29]+REG[0];
      10'h052: data = 32'h24040008; // 00400148: ADDIU, REG[4]<=REG[0]+8(=0x00000008);
      10'h053: data = 32'h0c100064; // 0040014c: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h054: data = 32'h00000000; // 00400150: SLL, REG[0]<=REG[0]<<0;
      10'h055: data = 32'h24040004; // 00400154: ADDIU, REG[4]<=REG[0]+4(=0x00000004);
      10'h056: data = 32'h0c100064; // 00400158: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h057: data = 32'h00000000; // 0040015c: SLL, REG[0]<=REG[0]<<0;
      10'h058: data = 32'h24040002; // 00400160: ADDIU, REG[4]<=REG[0]+2(=0x00000002);
      10'h059: data = 32'h0c100064; // 00400164: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h05a: data = 32'h00000000; // 00400168: SLL, REG[0]<=REG[0]<<0;
      10'h05b: data = 32'h24040001; // 0040016c: ADDIU, REG[4]<=REG[0]+1(=0x00000001);
      10'h05c: data = 32'h0c100064; // 00400170: JAL, PC<=0x00100064*4(=0x00400190); REG[31]<=PC+4
      10'h05d: data = 32'h00000000; // 00400174: SLL, REG[0]<=REG[0]<<0;
      10'h05e: data = 32'h03c0e821; // 00400178: ADDU, REG[29]<=REG[30]+REG[0];
      10'h05f: data = 32'h8fbf0014; // 0040017c: LW, REG[31]<=RAM[REG[29]+20];
      10'h060: data = 32'h8fbe0010; // 00400180: LW, REG[30]<=RAM[REG[29]+16];
      10'h061: data = 32'h27bd0018; // 00400184: ADDIU, REG[29]<=REG[29]+24(=0x00000018);
      10'h062: data = 32'h03e00008; // 00400188: JR, PC<=REG[31];
      10'h063: data = 32'h00000000; // 0040018c: SLL, REG[0]<=REG[0]<<0;
      10'h064: data = 32'h27bdfff0; // 00400190: ADDIU, REG[29]<=REG[29]+65520(=0x0000fff0);
      10'h065: data = 32'hafbe0008; // 00400194: SW, RAM[REG[29]+8]<=REG[30];
      10'h066: data = 32'h03a0f021; // 00400198: ADDU, REG[30]<=REG[29]+REG[0];
      10'h067: data = 32'hafc40010; // 0040019c: SW, RAM[REG[30]+16]<=REG[4];
      10'h068: data = 32'h24030320; // 004001a0: ADDIU, REG[3]<=REG[0]+800(=0x00000320);
      10'h069: data = 32'h8fc20010; // 004001a4: LW, REG[2]<=RAM[REG[30]+16];
      10'h06a: data = 32'h00000000; // 004001a8: SLL, REG[0]<=REG[0]<<0;
      10'h06b: data = 32'hac620000; // 004001ac: SW, RAM[REG[3]+0]<=REG[2];
      10'h06c: data = 32'h03c0e821; // 004001b0: ADDU, REG[29]<=REG[30]+REG[0];
      10'h06d: data = 32'h8fbe0008; // 004001b4: LW, REG[30]<=RAM[REG[29]+8];
      10'h06e: data = 32'h27bd0010; // 004001b8: ADDIU, REG[29]<=REG[29]+16(=0x00000010);
      10'h06f: data = 32'h03e00008; // 004001bc: JR, PC<=REG[31];
      10'h070: data = 32'h00000000; // 004001c0: SLL, REG[0]<=REG[0]<<0;
      10'h071: data = 32'h27bdfff8; // 004001c4: ADDIU, REG[29]<=REG[29]+65528(=0x0000fff8);
      10'h072: data = 32'hafbe0000; // 004001c8: SW, RAM[REG[29]+0]<=REG[30];
      10'h073: data = 32'h03a0f021; // 004001cc: ADDU, REG[30]<=REG[29]+REG[0];
      10'h074: data = 32'hafc40008; // 004001d0: SW, RAM[REG[30]+8]<=REG[4];
      10'h075: data = 32'h24020308; // 004001d4: ADDIU, REG[2]<=REG[0]+776(=0x00000308);
      10'h076: data = 32'hac400000; // 004001d8: SW, RAM[REG[2]+0]<=REG[0];
      10'h077: data = 32'h2403030c; // 004001dc: ADDIU, REG[3]<=REG[0]+780(=0x0000030c);
      10'h078: data = 32'h24020001; // 004001e0: ADDIU, REG[2]<=REG[0]+1(=0x00000001);
      10'h079: data = 32'hac620000; // 004001e4: SW, RAM[REG[3]+0]<=REG[2];
      10'h07a: data = 32'h24030308; // 004001e8: ADDIU, REG[3]<=REG[0]+776(=0x00000308);
      10'h07b: data = 32'h24020001; // 004001ec: ADDIU, REG[2]<=REG[0]+1(=0x00000001);
      10'h07c: data = 32'hac620000; // 004001f0: SW, RAM[REG[3]+0]<=REG[2];
      10'h07d: data = 32'h24020308; // 004001f4: ADDIU, REG[2]<=REG[0]+776(=0x00000308);
      10'h07e: data = 32'hac400000; // 004001f8: SW, RAM[REG[2]+0]<=REG[0];
      10'h07f: data = 32'h24030308; // 004001fc: ADDIU, REG[3]<=REG[0]+776(=0x00000308);
      10'h080: data = 32'h24020001; // 00400200: ADDIU, REG[2]<=REG[0]+1(=0x00000001);
      10'h081: data = 32'hac620000; // 00400204: SW, RAM[REG[3]+0]<=REG[2];
      10'h082: data = 32'h08100089; // 00400208: J, PC<=0x00100089*4(=0x00400224);
      10'h083: data = 32'h00000000; // 0040020c: SLL, REG[0]<=REG[0]<<0;
      10'h084: data = 32'h24020308; // 00400210: ADDIU, REG[2]<=REG[0]+776(=0x00000308);
      10'h085: data = 32'hac400000; // 00400214: SW, RAM[REG[2]+0]<=REG[0];
      10'h086: data = 32'h24030308; // 00400218: ADDIU, REG[3]<=REG[0]+776(=0x00000308);
      10'h087: data = 32'h24020001; // 0040021c: ADDIU, REG[2]<=REG[0]+1(=0x00000001);
      10'h088: data = 32'hac620000; // 00400220: SW, RAM[REG[3]+0]<=REG[2];
      10'h089: data = 32'h24020310; // 00400224: ADDIU, REG[2]<=REG[0]+784(=0x00000310);
      10'h08a: data = 32'h8c430000; // 00400228: LW, REG[3]<=RAM[REG[2]+0];
      10'h08b: data = 32'h2402ffff; // 0040022c: ADDIU, REG[2]<=REG[0]+65535(=0x0000ffff);
      10'h08c: data = 32'h1062fff7; // 00400230: BEQ, PC<=(REG[3] == REG[2])?PC+4+65527*4:PC+4;
      10'h08d: data = 32'h00000000; // 00400234: SLL, REG[0]<=REG[0]<<0;
      10'h08e: data = 32'h08100137; // 00400238: J, PC<=0x00100137*4(=0x004004dc);
      10'h08f: data = 32'h00000000; // 0040023c: SLL, REG[0]<=REG[0]<<0;
      10'h090: data = 32'h8fc20008; // 00400240: LW, REG[2]<=RAM[REG[30]+8];
      10'h091: data = 32'h00000000; // 00400244: SLL, REG[0]<=REG[0]<<0;
      10'h092: data = 32'h8c420000; // 00400248: LW, REG[2]<=RAM[REG[2]+0];
      10'h093: data = 32'h00000000; // 0040024c: SLL, REG[0]<=REG[0]<<0;
      10'h094: data = 32'h10400012; // 00400250: BEQ, PC<=(REG[2] == REG[0])?PC+4+18*4:PC+4;
      10'h095: data = 32'h00000000; // 00400254: SLL, REG[0]<=REG[0]<<0;
      10'h096: data = 32'h8fc20008; // 00400258: LW, REG[2]<=RAM[REG[30]+8];
      10'h097: data = 32'h00000000; // 0040025c: SLL, REG[0]<=REG[0]<<0;
      10'h098: data = 32'h8c420000; // 00400260: LW, REG[2]<=RAM[REG[2]+0];
      10'h099: data = 32'h00000000; // 00400264: SLL, REG[0]<=REG[0]<<0;
      10'h09a: data = 32'h2c42001b; // 00400268: SLTIU, REG[2]<=(REG[2]<27(=0x0000001b))?1:0;
      10'h09b: data = 32'h1040000b; // 0040026c: BEQ, PC<=(REG[2] == REG[0])?PC+4+11*4:PC+4;
      10'h09c: data = 32'h00000000; // 00400270: SLL, REG[0]<=REG[0]<<0;
      10'h09d: data = 32'h8fc20008; // 00400274: LW, REG[2]<=RAM[REG[30]+8];
      10'h09e: data = 32'h00000000; // 00400278: SLL, REG[0]<=REG[0]<<0;
      10'h09f: data = 32'h8c420000; // 0040027c: LW, REG[2]<=RAM[REG[2]+0];
      10'h0a0: data = 32'h00000000; // 00400280: SLL, REG[0]<=REG[0]<<0;
      10'h0a1: data = 32'h24430040; // 00400284: ADDIU, REG[3]<=REG[2]+64(=0x00000040);
      10'h0a2: data = 32'h8fc20008; // 00400288: LW, REG[2]<=RAM[REG[30]+8];
      10'h0a3: data = 32'h00000000; // 0040028c: SLL, REG[0]<=REG[0]<<0;
      10'h0a4: data = 32'hac430000; // 00400290: SW, RAM[REG[2]+0]<=REG[3];
      10'h0a5: data = 32'h0810012e; // 00400294: J, PC<=0x0010012e*4(=0x004004b8);
      10'h0a6: data = 32'h00000000; // 00400298: SLL, REG[0]<=REG[0]<<0;
      10'h0a7: data = 32'h8fc20008; // 0040029c: LW, REG[2]<=RAM[REG[30]+8];
      10'h0a8: data = 32'h00000000; // 004002a0: SLL, REG[0]<=REG[0]<<0;
      10'h0a9: data = 32'h8c420000; // 004002a4: LW, REG[2]<=RAM[REG[2]+0];
      10'h0aa: data = 32'h00000000; // 004002a8: SLL, REG[0]<=REG[0]<<0;
      10'h0ab: data = 32'h2c420030; // 004002ac: SLTIU, REG[2]<=(REG[2]<48(=0x00000030))?1:0;
      10'h0ac: data = 32'h14400010; // 004002b0: BNE, PC<=(REG[2] != REG[0])?PC+4+16*4:PC+4;
      10'h0ad: data = 32'h00000000; // 004002b4: SLL, REG[0]<=REG[0]<<0;
      10'h0ae: data = 32'h8fc20008; // 004002b8: LW, REG[2]<=RAM[REG[30]+8];
      10'h0af: data = 32'h00000000; // 004002bc: SLL, REG[0]<=REG[0]<<0;
      10'h0b0: data = 32'h8c420000; // 004002c0: LW, REG[2]<=RAM[REG[2]+0];
      10'h0b1: data = 32'h00000000; // 004002c4: SLL, REG[0]<=REG[0]<<0;
      10'h0b2: data = 32'h2c42003a; // 004002c8: SLTIU, REG[2]<=(REG[2]<58(=0x0000003a))?1:0;
      10'h0b3: data = 32'h10400009; // 004002cc: BEQ, PC<=(REG[2] == REG[0])?PC+4+9*4:PC+4;
      10'h0b4: data = 32'h00000000; // 004002d0: SLL, REG[0]<=REG[0]<<0;
      10'h0b5: data = 32'h8fc20008; // 004002d4: LW, REG[2]<=RAM[REG[30]+8];
      10'h0b6: data = 32'h00000000; // 004002d8: SLL, REG[0]<=REG[0]<<0;
      10'h0b7: data = 32'h8c430000; // 004002dc: LW, REG[3]<=RAM[REG[2]+0];
      10'h0b8: data = 32'h8fc20008; // 004002e0: LW, REG[2]<=RAM[REG[30]+8];
      10'h0b9: data = 32'h00000000; // 004002e4: SLL, REG[0]<=REG[0]<<0;
      10'h0ba: data = 32'hac430000; // 004002e8: SW, RAM[REG[2]+0]<=REG[3];
      10'h0bb: data = 32'h0810012e; // 004002ec: J, PC<=0x0010012e*4(=0x004004b8);
      10'h0bc: data = 32'h00000000; // 004002f0: SLL, REG[0]<=REG[0]<<0;
      10'h0bd: data = 32'h8fc20008; // 004002f4: LW, REG[2]<=RAM[REG[30]+8];
      10'h0be: data = 32'h00000000; // 004002f8: SLL, REG[0]<=REG[0]<<0;
      10'h0bf: data = 32'h8c420000; // 004002fc: LW, REG[2]<=RAM[REG[2]+0];
      10'h0c0: data = 32'h00000000; // 00400300: SLL, REG[0]<=REG[0]<<0;
      10'h0c1: data = 32'h14400006; // 00400304: BNE, PC<=(REG[2] != REG[0])?PC+4+6*4:PC+4;
      10'h0c2: data = 32'h00000000; // 00400308: SLL, REG[0]<=REG[0]<<0;
      10'h0c3: data = 32'h8fc30008; // 0040030c: LW, REG[3]<=RAM[REG[30]+8];
      10'h0c4: data = 32'h24020040; // 00400310: ADDIU, REG[2]<=REG[0]+64(=0x00000040);
      10'h0c5: data = 32'hac620000; // 00400314: SW, RAM[REG[3]+0]<=REG[2];
      10'h0c6: data = 32'h0810012e; // 00400318: J, PC<=0x0010012e*4(=0x004004b8);
      10'h0c7: data = 32'h00000000; // 0040031c: SLL, REG[0]<=REG[0]<<0;
      10'h0c8: data = 32'h8fc20008; // 00400320: LW, REG[2]<=RAM[REG[30]+8];
      10'h0c9: data = 32'h00000000; // 00400324: SLL, REG[0]<=REG[0]<<0;
      10'h0ca: data = 32'h8c430000; // 00400328: LW, REG[3]<=RAM[REG[2]+0];
      10'h0cb: data = 32'h2402001b; // 0040032c: ADDIU, REG[2]<=REG[0]+27(=0x0000001b);
      10'h0cc: data = 32'h14620006; // 00400330: BNE, PC<=(REG[3] != REG[2])?PC+4+6*4:PC+4;
      10'h0cd: data = 32'h00000000; // 00400334: SLL, REG[0]<=REG[0]<<0;
      10'h0ce: data = 32'h8fc30008; // 00400338: LW, REG[3]<=RAM[REG[30]+8];
      10'h0cf: data = 32'h2402005b; // 0040033c: ADDIU, REG[2]<=REG[0]+91(=0x0000005b);
      10'h0d0: data = 32'hac620000; // 00400340: SW, RAM[REG[3]+0]<=REG[2];
      10'h0d1: data = 32'h0810012e; // 00400344: J, PC<=0x0010012e*4(=0x004004b8);
      10'h0d2: data = 32'h00000000; // 00400348: SLL, REG[0]<=REG[0]<<0;
      10'h0d3: data = 32'h8fc20008; // 0040034c: LW, REG[2]<=RAM[REG[30]+8];
      10'h0d4: data = 32'h00000000; // 00400350: SLL, REG[0]<=REG[0]<<0;
      10'h0d5: data = 32'h8c430000; // 00400354: LW, REG[3]<=RAM[REG[2]+0];
      10'h0d6: data = 32'h2402001d; // 00400358: ADDIU, REG[2]<=REG[0]+29(=0x0000001d);
      10'h0d7: data = 32'h14620006; // 0040035c: BNE, PC<=(REG[3] != REG[2])?PC+4+6*4:PC+4;
      10'h0d8: data = 32'h00000000; // 00400360: SLL, REG[0]<=REG[0]<<0;
      10'h0d9: data = 32'h8fc30008; // 00400364: LW, REG[3]<=RAM[REG[30]+8];
      10'h0da: data = 32'h2402005d; // 00400368: ADDIU, REG[2]<=REG[0]+93(=0x0000005d);
      10'h0db: data = 32'hac620000; // 0040036c: SW, RAM[REG[3]+0]<=REG[2];
      10'h0dc: data = 32'h0810012e; // 00400370: J, PC<=0x0010012e*4(=0x004004b8);
      10'h0dd: data = 32'h00000000; // 00400374: SLL, REG[0]<=REG[0]<<0;
      10'h0de: data = 32'h8fc20008; // 00400378: LW, REG[2]<=RAM[REG[30]+8];
      10'h0df: data = 32'h00000000; // 0040037c: SLL, REG[0]<=REG[0]<<0;
      10'h0e0: data = 32'h8c420000; // 00400380: LW, REG[2]<=RAM[REG[2]+0];
      10'h0e1: data = 32'h00000000; // 00400384: SLL, REG[0]<=REG[0]<<0;
      10'h0e2: data = 32'h2c420020; // 00400388: SLTIU, REG[2]<=(REG[2]<32(=0x00000020))?1:0;
      10'h0e3: data = 32'h14400010; // 0040038c: BNE, PC<=(REG[2] != REG[0])?PC+4+16*4:PC+4;
      10'h0e4: data = 32'h00000000; // 00400390: SLL, REG[0]<=REG[0]<<0;
      10'h0e5: data = 32'h8fc20008; // 00400394: LW, REG[2]<=RAM[REG[30]+8];
      10'h0e6: data = 32'h00000000; // 00400398: SLL, REG[0]<=REG[0]<<0;
      10'h0e7: data = 32'h8c420000; // 0040039c: LW, REG[2]<=RAM[REG[2]+0];
      10'h0e8: data = 32'h00000000; // 004003a0: SLL, REG[0]<=REG[0]<<0;
      10'h0e9: data = 32'h2c420030; // 004003a4: SLTIU, REG[2]<=(REG[2]<48(=0x00000030))?1:0;
      10'h0ea: data = 32'h10400009; // 004003a8: BEQ, PC<=(REG[2] == REG[0])?PC+4+9*4:PC+4;
      10'h0eb: data = 32'h00000000; // 004003ac: SLL, REG[0]<=REG[0]<<0;
      10'h0ec: data = 32'h8fc20008; // 004003b0: LW, REG[2]<=RAM[REG[30]+8];
      10'h0ed: data = 32'h00000000; // 004003b4: SLL, REG[0]<=REG[0]<<0;
      10'h0ee: data = 32'h8c430000; // 004003b8: LW, REG[3]<=RAM[REG[2]+0];
      10'h0ef: data = 32'h8fc20008; // 004003bc: LW, REG[2]<=RAM[REG[30]+8];
      10'h0f0: data = 32'h00000000; // 004003c0: SLL, REG[0]<=REG[0]<<0;
      10'h0f1: data = 32'hac430000; // 004003c4: SW, RAM[REG[2]+0]<=REG[3];
      10'h0f2: data = 32'h0810012e; // 004003c8: J, PC<=0x0010012e*4(=0x004004b8);
      10'h0f3: data = 32'h00000000; // 004003cc: SLL, REG[0]<=REG[0]<<0;
      10'h0f4: data = 32'h8fc20008; // 004003d0: LW, REG[2]<=RAM[REG[30]+8];
      10'h0f5: data = 32'h00000000; // 004003d4: SLL, REG[0]<=REG[0]<<0;
      10'h0f6: data = 32'h8c430000; // 004003d8: LW, REG[3]<=RAM[REG[2]+0];
      10'h0f7: data = 32'h2402003a; // 004003dc: ADDIU, REG[2]<=REG[0]+58(=0x0000003a);
      10'h0f8: data = 32'h14620006; // 004003e0: BNE, PC<=(REG[3] != REG[2])?PC+4+6*4:PC+4;
      10'h0f9: data = 32'h00000000; // 004003e4: SLL, REG[0]<=REG[0]<<0;
      10'h0fa: data = 32'h8fc30008; // 004003e8: LW, REG[3]<=RAM[REG[30]+8];
      10'h0fb: data = 32'h2402003f; // 004003ec: ADDIU, REG[2]<=REG[0]+63(=0x0000003f);
      10'h0fc: data = 32'hac620000; // 004003f0: SW, RAM[REG[3]+0]<=REG[2];
      10'h0fd: data = 32'h0810012e; // 004003f4: J, PC<=0x0010012e*4(=0x004004b8);
      10'h0fe: data = 32'h00000000; // 004003f8: SLL, REG[0]<=REG[0]<<0;
      10'h0ff: data = 32'h8fc20008; // 004003fc: LW, REG[2]<=RAM[REG[30]+8];
      10'h100: data = 32'h00000000; // 00400400: SLL, REG[0]<=REG[0]<<0;
      10'h101: data = 32'h8c430000; // 00400404: LW, REG[3]<=RAM[REG[2]+0];
      10'h102: data = 32'h2402003b; // 00400408: ADDIU, REG[2]<=REG[0]+59(=0x0000003b);
      10'h103: data = 32'h14620006; // 0040040c: BNE, PC<=(REG[3] != REG[2])?PC+4+6*4:PC+4;
      10'h104: data = 32'h00000000; // 00400410: SLL, REG[0]<=REG[0]<<0;
      10'h105: data = 32'h8fc30008; // 00400414: LW, REG[3]<=RAM[REG[30]+8];
      10'h106: data = 32'h2402003d; // 00400418: ADDIU, REG[2]<=REG[0]+61(=0x0000003d);
      10'h107: data = 32'hac620000; // 0040041c: SW, RAM[REG[3]+0]<=REG[2];
      10'h108: data = 32'h0810012e; // 00400420: J, PC<=0x0010012e*4(=0x004004b8);
      10'h109: data = 32'h00000000; // 00400424: SLL, REG[0]<=REG[0]<<0;
      10'h10a: data = 32'h8fc20008; // 00400428: LW, REG[2]<=RAM[REG[30]+8];
      10'h10b: data = 32'h00000000; // 0040042c: SLL, REG[0]<=REG[0]<<0;
      10'h10c: data = 32'h8c430000; // 00400430: LW, REG[3]<=RAM[REG[2]+0];
      10'h10d: data = 32'h2402003c; // 00400434: ADDIU, REG[2]<=REG[0]+60(=0x0000003c);
      10'h10e: data = 32'h14620006; // 00400438: BNE, PC<=(REG[3] != REG[2])?PC+4+6*4:PC+4;
      10'h10f: data = 32'h00000000; // 0040043c: SLL, REG[0]<=REG[0]<<0;
      10'h110: data = 32'h8fc30008; // 00400440: LW, REG[3]<=RAM[REG[30]+8];
      10'h111: data = 32'h2402003b; // 00400444: ADDIU, REG[2]<=REG[0]+59(=0x0000003b);
      10'h112: data = 32'hac620000; // 00400448: SW, RAM[REG[3]+0]<=REG[2];
      10'h113: data = 32'h0810012e; // 0040044c: J, PC<=0x0010012e*4(=0x004004b8);
      10'h114: data = 32'h00000000; // 00400450: SLL, REG[0]<=REG[0]<<0;
      10'h115: data = 32'h8fc20008; // 00400454: LW, REG[2]<=RAM[REG[30]+8];
      10'h116: data = 32'h00000000; // 00400458: SLL, REG[0]<=REG[0]<<0;
      10'h117: data = 32'h8c430000; // 0040045c: LW, REG[3]<=RAM[REG[2]+0];
      10'h118: data = 32'h2402003d; // 00400460: ADDIU, REG[2]<=REG[0]+61(=0x0000003d);
      10'h119: data = 32'h14620006; // 00400464: BNE, PC<=(REG[3] != REG[2])?PC+4+6*4:PC+4;
      10'h11a: data = 32'h00000000; // 00400468: SLL, REG[0]<=REG[0]<<0;
      10'h11b: data = 32'h8fc30008; // 0040046c: LW, REG[3]<=RAM[REG[30]+8];
      10'h11c: data = 32'h2402003a; // 00400470: ADDIU, REG[2]<=REG[0]+58(=0x0000003a);
      10'h11d: data = 32'hac620000; // 00400474: SW, RAM[REG[3]+0]<=REG[2];
      10'h11e: data = 32'h0810012e; // 00400478: J, PC<=0x0010012e*4(=0x004004b8);
      10'h11f: data = 32'h00000000; // 0040047c: SLL, REG[0]<=REG[0]<<0;
      10'h120: data = 32'h8fc20008; // 00400480: LW, REG[2]<=RAM[REG[30]+8];
      10'h121: data = 32'h00000000; // 00400484: SLL, REG[0]<=REG[0]<<0;
      10'h122: data = 32'h8c430000; // 00400488: LW, REG[3]<=RAM[REG[2]+0];
      10'h123: data = 32'h2402003e; // 0040048c: ADDIU, REG[2]<=REG[0]+62(=0x0000003e);
      10'h124: data = 32'h14620006; // 00400490: BNE, PC<=(REG[3] != REG[2])?PC+4+6*4:PC+4;
      10'h125: data = 32'h00000000; // 00400494: SLL, REG[0]<=REG[0]<<0;
      10'h126: data = 32'h8fc30008; // 00400498: LW, REG[3]<=RAM[REG[30]+8];
      10'h127: data = 32'h2402000a; // 0040049c: ADDIU, REG[2]<=REG[0]+10(=0x0000000a);
      10'h128: data = 32'hac620000; // 004004a0: SW, RAM[REG[3]+0]<=REG[2];
      10'h129: data = 32'h0810012e; // 004004a4: J, PC<=0x0010012e*4(=0x004004b8);
      10'h12a: data = 32'h00000000; // 004004a8: SLL, REG[0]<=REG[0]<<0;
      10'h12b: data = 32'h8fc30008; // 004004ac: LW, REG[3]<=RAM[REG[30]+8];
      10'h12c: data = 32'h24020040; // 004004b0: ADDIU, REG[2]<=REG[0]+64(=0x00000040);
      10'h12d: data = 32'hac620000; // 004004b4: SW, RAM[REG[3]+0]<=REG[2];
      10'h12e: data = 32'h24020308; // 004004b8: ADDIU, REG[2]<=REG[0]+776(=0x00000308);
      10'h12f: data = 32'hac400000; // 004004bc: SW, RAM[REG[2]+0]<=REG[0];
      10'h130: data = 32'h24030308; // 004004c0: ADDIU, REG[3]<=REG[0]+776(=0x00000308);
      10'h131: data = 32'h24020001; // 004004c4: ADDIU, REG[2]<=REG[0]+1(=0x00000001);
      10'h132: data = 32'hac620000; // 004004c8: SW, RAM[REG[3]+0]<=REG[2];
      10'h133: data = 32'h8fc20008; // 004004cc: LW, REG[2]<=RAM[REG[30]+8];
      10'h134: data = 32'h00000000; // 004004d0: SLL, REG[0]<=REG[0]<<0;
      10'h135: data = 32'h24420004; // 004004d4: ADDIU, REG[2]<=REG[2]+4(=0x00000004);
      10'h136: data = 32'hafc20008; // 004004d8: SW, RAM[REG[30]+8]<=REG[2];
      10'h137: data = 32'h24020310; // 004004dc: ADDIU, REG[2]<=REG[0]+784(=0x00000310);
      10'h138: data = 32'h8c430000; // 004004e0: LW, REG[3]<=RAM[REG[2]+0];
      10'h139: data = 32'h8fc20008; // 004004e4: LW, REG[2]<=RAM[REG[30]+8];
      10'h13a: data = 32'h00000000; // 004004e8: SLL, REG[0]<=REG[0]<<0;
      10'h13b: data = 32'hac430000; // 004004ec: SW, RAM[REG[2]+0]<=REG[3];
      10'h13c: data = 32'h8fc20008; // 004004f0: LW, REG[2]<=RAM[REG[30]+8];
      10'h13d: data = 32'h00000000; // 004004f4: SLL, REG[0]<=REG[0]<<0;
      10'h13e: data = 32'h8c430000; // 004004f8: LW, REG[3]<=RAM[REG[2]+0];
      10'h13f: data = 32'h2402003e; // 004004fc: ADDIU, REG[2]<=REG[0]+62(=0x0000003e);
      10'h140: data = 32'h1462ff4f; // 00400500: BNE, PC<=(REG[3] != REG[2])?PC+4+65359*4:PC+4;
      10'h141: data = 32'h00000000; // 00400504: SLL, REG[0]<=REG[0]<<0;
      10'h142: data = 32'h8fc20008; // 00400508: LW, REG[2]<=RAM[REG[30]+8];
      10'h143: data = 32'h00000000; // 0040050c: SLL, REG[0]<=REG[0]<<0;
      10'h144: data = 32'hac400000; // 00400510: SW, RAM[REG[2]+0]<=REG[0];
      10'h145: data = 32'h24020308; // 00400514: ADDIU, REG[2]<=REG[0]+776(=0x00000308);
      10'h146: data = 32'hac400000; // 00400518: SW, RAM[REG[2]+0]<=REG[0];
      10'h147: data = 32'h2402030c; // 0040051c: ADDIU, REG[2]<=REG[0]+780(=0x0000030c);
      10'h148: data = 32'hac400000; // 00400520: SW, RAM[REG[2]+0]<=REG[0];
      10'h149: data = 32'h24030308; // 00400524: ADDIU, REG[3]<=REG[0]+776(=0x00000308);
      10'h14a: data = 32'h24020001; // 00400528: ADDIU, REG[2]<=REG[0]+1(=0x00000001);
      10'h14b: data = 32'hac620000; // 0040052c: SW, RAM[REG[3]+0]<=REG[2];
      10'h14c: data = 32'h24020308; // 00400530: ADDIU, REG[2]<=REG[0]+776(=0x00000308);
      10'h14d: data = 32'hac400000; // 00400534: SW, RAM[REG[2]+0]<=REG[0];
      10'h14e: data = 32'h03c0e821; // 00400538: ADDU, REG[29]<=REG[30]+REG[0];
      10'h14f: data = 32'h8fbe0000; // 0040053c: LW, REG[30]<=RAM[REG[29]+0];
      10'h150: data = 32'h27bd0008; // 00400540: ADDIU, REG[29]<=REG[29]+8(=0x00000008);
      10'h151: data = 32'h03e00008; // 00400544: JR, PC<=REG[31];
      10'h152: data = 32'h00000000; // 00400548: SLL, REG[0]<=REG[0]<<0;
      10'h153: data = 32'h00000000; // 0040054c: SLL, REG[0]<=REG[0]<<0;
    endcase
  end

  assign rom_data = data;
endmodule
