
function fun_file_load(_fname) {
	
	var _loaded = {}
	
	if file_exists(_fname) then {
		
		var _file = file_text_open_read(_fname)
		var _string = ""
		
		while(not file_text_eof(_file)) {
			_string += file_text_readln(_file)
		}
		
		_loaded = json_parse(_string)
		
		file_text_close(_file)
		
	}
	
	return _loaded
	
}

function fun_file_save(_fname, _struct, _make_json_pretty = false) {
	
	if file_exists(_fname) then file_delete(_fname)
	
	var _file = file_text_open_write(_fname)
	
	file_text_write_string(_file, json_stringify(_struct, _make_json_pretty))
	
	file_text_close(_file)
	
}


/*
//fun_file_save("bitch", {name: "ben", kids: [{name: "Billy", kids: []}, {name: "Sally", kids: []}]}, true)
show_message(fun_file_load("bitch"))

game_end()