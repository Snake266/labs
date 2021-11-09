import imports::states;

module fsm(
           input clk,
           input busy_tr,
           input empty_fifo,
           output re_fifo,
           output start_tr
           );
   reg [1:0]      state;
   always @ () begin
      case (state)
        IDLE: begin
           if(empty_fifo | busy_tr) state <= IDLE;
           else state <= LOAD;
        end

        LOAD: begin
           state <= TRANSMIT;
        end

        TRANSMIT: begin
           state <= IDLE;
        end
        default: state <= IDLE;
      endcase // case (state)
   end
endmodule // fsm
