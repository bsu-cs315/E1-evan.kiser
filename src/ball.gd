extends RigidBody2D

@export var power = 200
@export var power_change_rate = 100

@export var angle = (-TAU/4)
@export var angle_change_rate = (TAU/8)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var power_axis = Input.get_axis("decrease_power", "increase_power")
	power += power_axis * power_change_rate * delta
	power = clampf(power, 0, 1000)
	
	var angle_axis = Input.get_axis("angle_down", "angle_up")
	angle += angle_axis * angle_change_rate * delta
	angle = clampf(angle, deg_to_rad(-180), deg_to_rad(0))
	
	if Input.is_action_just_pressed("launch"):
		var impulse = Vector2(1, 0) * power
		apply_impulse(impulse.rotated(angle))
