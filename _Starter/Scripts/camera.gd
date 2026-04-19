class_name Camera extends Camera2D

var shake_duration := 0.0
var shake_amount := 0.0

func shake(amount: float, duration: float):
	shake_duration = duration
	shake_amount = amount

func _process(delta):
	if shake_duration > 0:
		shake_duration -= delta

	offset = Vector2.ONE.rotated(randf() * PI) * (shake_amount if shake_duration > 0 else 0.0)