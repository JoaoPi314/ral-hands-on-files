class cthulhu_reg_sequence extends uvm_sequence;
	`uvm_object_utils(cthulhu_reg_sequence)
	
	cthulhu_reg_block regmodel;
	

	function new(string name = "cthulhu_reg_sequence"); 
		super.new(name);    
	endfunction
   
	task body;  
		uvm_status_e   status;
		uvm_reg_data_t incoming;
		
		if (starting_phase != null)
			starting_phase.raise_objection(this);
		
		//Write to the Registers
		regmodel.ct_sanity_reg.write(status, 8'F5);
		regmodel.ct_life_reg.write(status, 8'F0);
		
		//Read from the registers
		regmodel.ct_status_reg.read(status, incoming);
		
		if (starting_phase != null)
			starting_phase.drop_objection(this);  
		
	endtask: body
endclass : cthulhu_reg_sequence