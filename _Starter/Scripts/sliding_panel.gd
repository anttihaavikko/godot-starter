class_name SlidingPanel
extends Control

@export var direction := Vector2.RIGHT
@export var duration := 0.2
@export var in_transition: Tween.TransitionType = Tween.TRANS_BOUNCE
@export var out_transition: Tween.TransitionType = Tween.TRANS_BOUNCE

var pos: Vector2
var open: bool
var can_toggle := true

func _ready():
	pos = position
	position += size.x * direction
	
func toggle():
	if not can_toggle: return
	pos = position if open else position - size.x * direction
	open = !open
	can_toggle = false
	get_tree().create_tween().tween_property(self , "position", pos if open else pos + size.x * direction, duration).set_trans(in_transition if open else out_transition)
	await get_tree().create_timer(duration).timeout
	can_toggle = true