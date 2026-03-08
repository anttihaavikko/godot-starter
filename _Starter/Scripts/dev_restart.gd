class_name DevRestart extends Node

func _input(event):
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_R) and OS.is_debug_build():
			get_tree().reload_current_scene()
