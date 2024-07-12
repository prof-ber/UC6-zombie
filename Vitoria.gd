extends Control

var block = true
var timer
 
func _ready():
	pass
 
func _input(event):
	if !block:
		var is_event_press = event is InputEventKey
		var is_other_press =  event is InputEventMouseButton or event is InputEventJoypadButton
		if (is_event_press and not event.echo) or is_other_press and event.pressed:
			get_tree().change_scene_to_file("res://game_scene.tscn")

func _on_timer_timeout():
	block = false
