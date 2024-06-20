extends Sprite2D

var power;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire():
	var new_bullet = Preloader.bullet.instantiate()
	new_bullet.global_position = self.global_position
	new_bullet.rotation_degrees = self.rotation_degrees
	get_tree().get_root().add_child(new_bullet)
