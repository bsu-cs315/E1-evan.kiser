extends Node2D

signal power_changed
signal angle_changed
signal projectile_amount_changed
signal no_remaining_projectiles

@export var power := 800.0
@export var power_change_rate := 200.0
var min_power := 0
var max_power := 2000

@export var angle := (-TAU/4)
@export var angle_change_rate := (TAU/8)

@export var can_shoot := true
@export var balls_left := 3
var current_ball : RigidBody2D = null


func _ready() -> void:
	_update_power_label()


func _process(delta: float) -> void:
	var power_axis := Input.get_axis("decrease_power", "increase_power")
	if power_axis != 0:
		power += power_axis * power_change_rate * delta
		power = clampf(power, min_power, max_power)
		power_changed.emit()
		
	var angle_axis = Input.get_axis("angle_down", "angle_up")
	if angle_axis != 0:
		angle += angle_axis * angle_change_rate * delta
		angle = clampf(angle, deg_to_rad(-180), deg_to_rad(0))
		angle_changed.emit()


	if Input.is_action_just_pressed("launch") and (balls_left > 0):
		if current_ball == null or current_ball.is_sleeping():
			var impulse := Vector2(1,0) * power
			current_ball = preload("res://src/ball.tscn").instantiate() as RigidBody2D
			get_parent().add_child(current_ball)
			current_ball.global_position = global_position
			current_ball.apply_impulse(impulse.rotated(angle))
			$CannonShotSound.playing = true
			balls_left -= 1
			if balls_left == 0:
				no_remaining_projectiles.emit()
			projectile_amount_changed.emit()


func _update_power_label() -> void:
	get_parent().get_node("PowerLabel").text = ("Power : %.d" % power)
