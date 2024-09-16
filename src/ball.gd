extends RigidBody2D

var _screen_bottom_limit: float

func _ready() -> void:
	_screen_bottom_limit = get_viewport_rect().size.y


func _on_sleeping_state_changed() -> void:
	emit_signal("projectile_sleeping_state_changed", is_sleeping)


func _process(_delta):
	if position.y > _screen_bottom_limit:
		queue_free()
