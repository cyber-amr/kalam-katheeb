extends Node


const SAVEFILE_PATH := "user://.options.json"
var data := get_default_options()


func _ready() -> void:
	load_locally()


func get_default_options() -> Dictionary:
	return {}


func save_locally() -> Error:
	var file := FileAccess.open(SAVEFILE_PATH, FileAccess.WRITE)
	if !file:
		return FileAccess.get_open_error()
	
	file.store_string(JSON.stringify(data, "  "))
	
	file.close()
	return OK


func load_locally() -> Error:
	var file := FileAccess.open(SAVEFILE_PATH, FileAccess.READ)
	if !file:
		push_warning("Could not load options data: [%s]" % [FileAccess.get_open_error()])
		return FileAccess.get_open_error()
	
	var json = JSON.parse_string(file.get_as_text())
	file.close()
	
	if json is Dictionary:
		data = json
	else:
		push_error("Failed to parse options data as Dictionary")
		return ERR_PARSE_ERROR
	
	return OK
