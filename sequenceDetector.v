module sequenceDetector(clock, reset, l, o, v, other, volvo, vool, lol, oolvo);

	input clock, reset;
	input v, o, l, other;

	output reg volvo, vool, lol, oolvo;

	reg[3:0]currentState, nextState; 

	parameter INIT = 4'b0000;
	parameter L = 4'b0001;
	parameter LO = 4'b0010;
	parameter LOL = 4'b0011;
	parameter O = 4'b0100;
	parameter OO = 4'b0101;
	parameter OOL = 4'b0110;
	parameter OOLV = 4'b0111;
	parameter OOLVO = 4'b1000;
	parameter VO = 4'b1001;
	parameter VOL = 4'b1010;
	parameter VOO = 4'b1011;
	parameter VOOL = 4'b1100;
	parameter VOLV = 4'b1101;
	parameter VOLVO = 4'b1110;
	parameter V = 4'b1111;
  
	// holds count of final state entries
	integer c_volvo = 0;
  	integer c_vool = 0;
	integer c_lol = 0;
	integer c_oolvo = 0;
  
	// Occurs every time v, o, l, or other is set to high.
	// Nothing happens if they are all low.
	// Return to INIT if two states are high or input is OTHER.
	always@(posedge v or posedge o or posedge l or posedge other)
	begin
		
		case(currentState)            
			
			INIT:	//initial state (S0)
			begin 
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = O; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end

			
			L:
			begin             
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = LO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end

			
			LO:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = LOL;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = OO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
 
			
			LOL:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = LO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end


			O:
			begin  
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = OO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
	
			
			OO:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = OOL;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = OO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
  
			
			OOL:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = LO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = OOLV;
				else 
					nextState = INIT; //if any other input return to initial state
			end
   
			
			OOLV:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = OOLVO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
	
			
			OOLVO:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = VOL;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = VOO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
  
			
			VO:
			begin  
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = VOL;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = VOO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
   
			
			VOL:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = LO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = VOLV;
				else 
					nextState = INIT; //if any other input return to initial state
			end
  
		   
			VOO:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = VOOL;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = OO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
   
			
			VOOL:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = LO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = OOLV;
				else 
					nextState = INIT; //if any other input return to initial state
			end
  
			
			VOLV:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = VOLVO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
   
			
			VOLVO:
			begin
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = VOL;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = VOO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end
   
			
			V:
			begin  
				if (v == 0 && o == 0 && l == 1 && other == 0) //if input is l
					nextState = L;
				else if(v == 0 && o == 1 && l == 0 && other == 0) //if input is o
					nextState = VO; 
				else if(v == 1 && o == 0 && l == 0 && other == 0) //if input is v
					nextState = V;
				else 
					nextState = INIT; //if any other input return to initial state
			end

		   
			default:
				nextState = INIT;
				
				
		endcase
  	end


	// Prints out the current state as it changes
	always@(currentState)
	begin
		
		case(currentState)            
			
			INIT:
			begin
				$display("Current State: INIT");
    		end
		
			L:
			begin
				$display("Current State: L");
			end
			
			LO:
			begin
				$display("Current State: LO");
			end
			
			LOL:
			begin
				$display("Current State: LOL {FINAL}");
				c_lol = c_lol + 1;
				$display("LOL Count: %d", c_lol);
			end
		
			O:
			begin
				$display("Current State: O");
			end
			
			OO:
			begin
				$display("Current State: OO");
			end
			
			OOL:
			begin
				$display("Current State: OOL");
			end
		   
			OOLV:
			begin
				$display("Current State: OOLV");
			end
			
			OOLVO:
			begin
				$display("Current State: OOLVO {FINAL}");
				c_oolvo = c_oolvo + 1;
				$display("OOLVO Count: %d", c_oolvo);
			end	
			
			VO:
			begin
				$display("Current State: VO");
			end
			
			VOL:
			begin
				$display("Current State: VOL");
			end
		
			VOO:
			begin
				$display("Current State: VOO");
			end

			VOOL:
			begin
				$display("Current State: VOOL {FINAL}");  
				c_vool = c_vool + 1;
				$display("VOOL Count: %d", c_vool);        
			end
		
			VOLV:
			begin
				$display("Current State: VOLV");  
			end
			
			VOLVO:
			begin
				$display("Current State: VOLVO {FINAL}");
				c_volvo = c_volvo + 1;
				$display("VOLVO Count: %d", c_volvo);
			end
		
			V:
			begin
				$display("Current State: V");     
			end
		endcase
  	end
	

	always@(posedge reset, posedge clock)
	begin
		if(reset == 1)
			begin 	   
				currentState = INIT;
				nextState = INIT;
				$display("* RESET *");
			end
	end
	

	always@(negedge reset, posedge clock)
	begin  
		if(reset == 1)
			begin 
				currentState = INIT;
				$display("* RESET *");
			end
		else 
			currentState <= nextState;
	end


	//for each new state approaching, if it is in final state, set said final state 
	//to high. set all final states to low otherwise.
	always@(nextState)
	begin
		if(nextState == VOLVO)
			begin 
				volvo = 1; 
				vool = 0; 
				lol = 0;
				oolvo = 0; 
			end
		else if(nextState == VOOL) 
			begin 
				volvo = 0; 
				vool = 1; 
				lol = 0;
				oolvo = 0;   
			end
		else if(nextState == LOL) 
			begin 
				volvo = 0; 
				vool = 0;
				lol = 1; 
				oolvo = 0;  
			end
		else if(nextState == OOLVO) 
			begin 
				volvo = 0; 
				vool = 0;
				lol = 0; 
				oolvo = 1; 
			end
		else
			begin 
				volvo = 0; 
				vool = 0; 
				lol = 0;
				oolvo = 0;
      		end
	end
endmodule