extends Node

@export var round = 0
signal roundChange

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_roundtime_timeout():
	round += 1
	emit_signal("roundChange", round)
	$Roundtime.wait_time = 180
	$Roundtime.start()
