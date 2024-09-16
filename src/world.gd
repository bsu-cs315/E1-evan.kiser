extends Node2D

func _process(_delta: float) -> void:
	$PowerLabel.modulate = Color.BLACK
	$AngleLabel.modulate = Color.BLACK
	$ProjectilesLeftLabel.modulate = Color.BLACK
	
	if $Goal.winDetector:
		$WinLabel.text = "You hit the Flag!"
		await(get_tree().create_timer(8).timeout)
		get_tree().change_scene_to_file("res://src/title_screen.tscn")


func _on_cannon_power_changed() -> void:
	$PowerLabel.text = "Power : %.d" % $Cannon.power
	$PowerLabel.modulate = Color.RED


func _on_cannon_angle_changed() -> void:
	$AngleLabel.text = "Angle : %.d" % rad_to_deg(-1*$Cannon.angle)
	$AngleLabel.modulate = Color.RED


func _on_cannon_projectile_amount_changed() -> void:
	$ProjectilesLeftLabel.text = "Projectiles Left : %.d" % $Cannon.balls_left
	$ProjectilesLeftLabel.modulate = Color.RED


func _on_cannon_no_remaining_projectiles() -> void:
	await(get_tree().create_timer(8).timeout)
	if not $Goal.winDetector:
		$WinLabel.text = "You lost!"
		await(get_tree().create_timer(8).timeout)
		get_tree().change_scene_to_file("res://src/title_screen.tscn")
