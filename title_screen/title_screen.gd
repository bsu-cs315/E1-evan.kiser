extends Control

func _process(_delta: float) -> void:
	$"Top_VBoxContainer/Game_Title".modulate = Color.BLACK
	$AnimationPlayer.play("logo_animation")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world.tscn")
