set moduleName execute
set isTopModule 0
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {execute}
set C_modelType { int 16 }
set C_modelArgList {
	{ pc_val int 16 regular  }
	{ d_i_type_val int 3 regular  }
	{ d_i_imm_val int 17 regular  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "pc_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "d_i_type_val", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "d_i_imm_val", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 16} ]}
# RTL Port declarations: 
set portNum 5
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ pc_val sc_in sc_lv 16 signal 0 } 
	{ d_i_type_val sc_in sc_lv 3 signal 1 } 
	{ d_i_imm_val sc_in sc_lv 17 signal 2 } 
	{ ap_return sc_out sc_lv 16 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "pc_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pc_val", "role": "default" }} , 
 	{ "name": "d_i_type_val", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "d_i_type_val", "role": "default" }} , 
 	{ "name": "d_i_imm_val", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "d_i_imm_val", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "execute",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pc_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_i_type_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_i_imm_val", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	execute {
		pc_val {Type I LastRead 0 FirstWrite -1}
		d_i_type_val {Type I LastRead 0 FirstWrite -1}
		d_i_imm_val {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	pc_val { ap_none {  { pc_val in_data 0 16 } } }
	d_i_type_val { ap_none {  { d_i_type_val in_data 0 3 } } }
	d_i_imm_val { ap_none {  { d_i_imm_val in_data 0 17 } } }
}
