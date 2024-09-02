extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PowerLabel.text = ("POWER: %.d" % $Ball.power)
	$AngleLabel.text = ("ANGLE: %.d" % rad_to_deg(-1*$Ball.angle))
