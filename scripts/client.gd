extends Node


var pause_menu := preload("res://scenes/pause_menu.tscn")


func pause() -> void:
	if !has_node("pause_menu"):
		add_child(pause_menu.instantiate())


func unpause() -> void:
	pass


func quit() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
