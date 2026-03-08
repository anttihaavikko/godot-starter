class_name ButtonHover extends Button

var sound_index := 23

func _ready():
	mouse_entered.connect(hover_in)
	mouse_exited.connect(hover_out)
	pressed.connect(hover_out)

func hover_sound():
	if SoundEffects.singleton and SoundEffects.singleton.effects.size() > sound_index:
		SoundEffects.singleton.add(sound_index, global_position)
	
func hover_in():
	pivot_offset = size * 0.5
	get_tree().create_tween().tween_property(self , "rotation_degrees", randf_range(-1, 1) * 3, 0.15).set_trans(Tween.TRANS_BOUNCE)
	get_tree().create_tween().tween_property(self , "scale", Vector2.ONE * 1.05, 0.15).set_trans(Tween.TRANS_BOUNCE)
	hover_sound()

func hover_out():
	get_tree().create_tween().tween_property(self , "rotation_degrees", 0, 0.1).set_trans(Tween.TRANS_BOUNCE)
	get_tree().create_tween().tween_property(self , "scale", Vector2.ONE, 0.15).set_trans(Tween.TRANS_BOUNCE)
	hover_sound()