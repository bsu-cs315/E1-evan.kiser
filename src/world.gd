extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PowerLabel.text = ("POWER: %.d" % $Ball.power)
	$AngleLabel.text = ("ANGLE: %.d" % rad_to_deg(-1*$Ball.angle))
