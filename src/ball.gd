extends RigidBody2D

@export var power = 200
@export var power_change_rate = 100
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var power_axis = Input.get_axis("decreased_power", "increase_power")
	power += power_axis * power_change_rate * delta	
	power = clampf(power, 0, 1000)
	
	if Input.is_action_just_pressed("launch"):
		var impulse = Vector2(1,0) * power
		apply_impulse(impulse.rotated(-TAU/8))
