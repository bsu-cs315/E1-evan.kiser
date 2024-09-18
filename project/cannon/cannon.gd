extends Node2D

signal power_changed
signal angle_changed
signal projectile_amount_changed
signal no_remaining_projectiles

const _MIN_POWER := 0
const _MAX_POWER := 2000
const _MIN_ANGLE := deg_to_rad(-180)
const _MAX_ANGLE :=deg_to_rad(0)

@export var power := 800.
@export var power_change_rate := 200.
@export var angle := -TAU/4
@export var angle_change_rate := TAU/8
@export var can_shoot := true
@export var balls_left := 3
var _current_ball : RigidBody2D = null


func _process(delta: float) -> void:
	var power_axis := Input.get_axis("decrease_power", "increase_power")
	if power_axis != 0:
		power += power_axis * power_change_rate * delta
		power = clampf(power, _MIN_POWER, _MAX_POWER)
		power_changed.emit()
		
	var angle_axis = Input.get_axis("angle_down", "angle_up")
	if angle_axis != 0:
		angle += angle_axis * angle_change_rate * delta
		angle = clampf(angle, _MIN_ANGLE, _MAX_ANGLE)
		angle_changed.emit()

	if Input.is_action_just_pressed("launch") and balls_left > 0:
		if _current_ball == null or _current_ball.is_sleeping():
			var impulse := Vector2(1,0) * power
			_current_ball = preload("res://ball/ball.tscn").instantiate() as RigidBody2D
			get_parent().add_child(_current_ball)
			_current_ball.global_position = global_position
			_current_ball.apply_impulse(impulse.rotated(angle))
			$CannonShotSound.playing = true
			balls_left -= 1
			if balls_left == 0:
				no_remaining_projectiles.emit()
			projectile_amount_changed.emit()
