extends Node2D

signal power_changed
signal angle_changed
signal projectile_amount_changed

@export var power := 800.0
@export var power_change_rate := 200.0
var min_power := 0
var max_power := 2000

@export var angle := (-TAU/4)
@export var angle_change_rate := (TAU/8)

# will be used to determine whether the ball is alive and moving or not
@export var ball_exist := false
@export var projectiles_left := 3

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
		
	if(!ball_exist):
		if Input.is_action_just_pressed("launch") and (projectiles_left > 0):
			var impulse := Vector2(1,0) * power
			var ball : RigidBody2D = preload("res://src/ball.tscn").instantiate()
			get_parent().add_child(ball)
			ball.global_position = global_position
			ball.apply_impulse(impulse.rotated(angle))
			ball_exist = true
			projectiles_left -= 1
			projectile_amount_changed.emit()
			
func _update_power_label() -> void:
	get_parent().get_node("PowerLabel").text = ("Power : %.d" % power)

func _draw() -> void:
	draw_circle(Vector2.ZERO, 40, Color.BLACK)
	draw_line(Vector2.ZERO, Vector2(80, 0).rotated(-TAU/8), Color.BLACK, 5)
