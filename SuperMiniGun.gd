extends Sprite2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire():
	var new_bullet = Preloader.bullet.instantiate()
	new_bullet.global_position = self.global_position
	new_bullet.rotation_degrees = self.rotation_degrees + rng.randf_range(-10.0, 10.0)
	var new_bullet2 = Preloader.bullet.instantiate()
	new_bullet2.global_position = self.global_position
	new_bullet2.rotation_degrees = self.rotation_degrees + rng.randf_range(-10.0, 10.0)
	var new_bullet3 = Preloader.bullet.instantiate()
	new_bullet3.global_position = self.global_position
	new_bullet3.rotation_degrees = self.rotation_degrees + rng.randf_range(-10.0, 10.0)
	get_tree().get_root().add_child(new_bullet)
	$AudioStreamPlayer2.play()
	$AudioStreamPlayer3.play()
	$AudioStreamPlayer3.play()
