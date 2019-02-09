module sequenceDetectorTest;

	reg Reset, Clock;
  	reg l_input, o_input, v_input, other_input;
  
  	wire volvo_state, vool_state, lol_state, oolvo_state;
  
   	sequenceDetector detect(Clock, Reset, l_input, o_input, v_input, other_input, volvo_state, vool_state, lol_state, oolvo_state);

  	always
  	begin
		Clock <= 0;
		#1;  
		Clock <= 1;
		#1; 
  	end
  
  	 
  	
  	//when volvo_state changes.
	always@ (volvo_state) 
	begin
		if (volvo_state == 1) 
			$display("* ENTERING VOLVO *");
		else 
			$display("* NOT IN VOLVO *");
	end

	//when vool_state changes. 
	always@ (vool_state)
	begin
		if (vool_state == 1) 
			$display("* ENTERING VOOL *");
		else 
			$display("* NOT IN VOOL *");
	end

	//when lol_state changes. 
	always@ (lol_state)  
	begin
		if (lol_state == 1) 
			$display("* ENTERING LOL *");
		else 
			$display("* NOT IN LOL *");
	end

	//when oolvo_state changes. 
	always@ (oolvo_state)  
	begin
		if (oolvo_state == 1) 
			$display("* ENTERING OOLVO *");
		else 
			$display("* NOT IN OOLVO *");
	end
	
  
  
  
  
  
	initial
	begin
  
		//set inputs to 0 so everything is low to start 
		l_input = 0;
		o_input = 0;
		v_input = 0;
		other_input = 0;
  
  
		//reset fsm to begin so that everything is clean to start
		Reset <= 1;
		#1;     
		Reset <= 0;
		#1;     
	
		//                  volvo vool lol         oolvo   lol
		//test string: LLOOVVOLVOLVOOLOLOLOL[OTHER]OOLVOLVOLOLOOLVOVLOVL[OTHER]
		//                     volvo lol lol          volvo   oolvo
		
		//VOLVO: 3
		//VOOL: 1
		//LOL: 4
		//OOLVO:2
		
		// L input <L>
		l_input <= 1; 
		#4; 
   
		// //L repeat <set to low here and high on next one>
		l_input <= 0; 
		#4;
	
		// L input <L>
		l_input <= 1; 
		#4; 
   
		// O input <LO>
		l_input <= 0; 
		o_input <= 1;
		#4;
  
	   	// //O repeat <set to low here and high on next one>
		o_input <= 0;
		#4;
  
	  	// O input <OO>
		o_input <= 1;
		#4; 
 
	  	// V input <V>
		o_input <= 0;
		v_input <= 1;
		#4;
   
		// //V repeat <set to low here and high on next one>
		v_input <= 0;
		#4; 

		// V input <V>
		v_input <= 1;
		#4; 

	  	// O input <VO>
		v_input <= 0;
		o_input <= 1;      
		#4; 
	
	   	// L input <VOL>
		o_input <= 0; 
		l_input <= 1;
		#4; 

		// V input <VOLV>
	   	l_input <= 0; 
		v_input <= 1;
		#4; 

		// O input <VOLVO> FINAL STATE {acceptance} VOVLO: 1 
	   	v_input <= 0; 
		o_input <= 1;
		#4; 

		// L input <VOL>
	   	o_input <= 0; 
		l_input <= 1;
		#4;
		
		// V input <VOLV> 
		l_input <= 0;
		v_input <= 1;
		#4;
		
		// O input <VOLVO> FINAL STATE {acceptance} VOLVO: 2
		v_input <= 0; 
		o_input <= 1;
		#4; 
   
		// //O repeat <set to low here and high on next one>
		o_input <= 0; 
		#4;
	
		// O input <VOO>
		o_input <= 1; 
		#4;
		
		// L input <VOOL> FINAL STATE {acceptance} VOOL: 1
	   	o_input <= 0; 
		l_input <= 1;
		#4; 
   
   		// O input <LO>
		l_input <= 0;
		o_input <= 1;      
		#4;
		
		// L input <LOL> FINAL STATE {acceptance} LOL: 1
	   	o_input <= 0; 
		l_input <= 1;
		#4;
		
		// O input <LO>
		l_input <= 0;
		o_input <= 1;      
		#4;
		
		// L input <LOL> FINAL STATE {acceptance} LOL: 2
	   	o_input <= 0; 
		l_input <= 1;
		#4;
		
		// O input <LO>
		l_input <= 0;
		o_input <= 1;      
		#4;
		
		// L input <LOL> FINAL STATE {acceptance} LOL: 3 
	   	o_input <= 0; 
		l_input <= 1;
		#4;
		
		// OTHER input <INIT>
		l_input <= 0;
		other_input <= 1;
		#4;
		
		// O input <O> 
		other_input <= 0;
		o_input <= 1;
		#4;
		
		// //O repeat <set to low here and high on next one>
		o_input <= 0;
		#4;
		
		// O input <OO>
		o_input <= 1;
		#4;
		 
		// L input <OOL>
		o_input <= 0;
		l_input <= 1;
		#4;
		
		// V input <OOLV>
		l_input <= 0;
		v_input <= 1;
		#4;
		
		// O input <OOLVO> FINAL STATE {acceptance} OOLVO: 1
		v_input <= 0;
		o_input <= 1;
		#4;
		
		// L input <VOL>
		o_input <= 0;
		l_input <= 1;
		#4;
		
		// V input <VOLV>
		l_input <= 0;
		v_input <= 1;
		#4; 
		
		// O input <VOLVO> FINAL STATE {acceptance} VOLVO: 3
		v_input <= 0;
		o_input <= 1;
		#4; 
		
		// L input <VOL>
		o_input <= 0;
		l_input <= 1;
		#4;
		
		// O input <LO>
		l_input <= 0;
		o_input <= 1;
		#4;
		
		// L input <LOL> FINAL STATE {acceptance} LOL: 4
		o_input <= 0;
		l_input <= 1;
		#4;
		
		// O input <LO> 
		l_input <= 0; 
		o_input <= 1;
		#4; 
   
		// //O repeat <set to low here and high on next one>
		o_input <= 0; 
		#4;
	
		// O input <OO>
		o_input <= 1; 
		#4;
		
		// L input <OOL>
		o_input <= 0;
		l_input <= 1;
		#4; 
		
		// V input <OOLV>
		l_input <= 0;
		v_input <= 1; 
		#4;
		
		// O input <OOLVO> FINAL STATE {acceptance} OOLVO: 2
		v_input <= 0;
		o_input <= 1;
		#4;
		
		// V input <V>
		o_input <= 0;
		v_input <= 1;
		#4;
		
		// L input <L>
		v_input <= 0;
		l_input <= 1;
		#4;
		
		// O input <LO>
		l_input <= 0;
		o_input <= 1;
		#4;
		
		// V input <V>
		o_input <= 0;
		v_input <= 1;
		#4;
		
		// L input <L>
		v_input <= 0;
		l_input <= 1;
		#4;
		
		// OTHER input <INIT>
		l_input <= 0;
		other_input <= 1;
		#4; 
		
		// end of string put high inputs to low
		other_input <= 0;
		#4;
		 
	  end

endmodule













