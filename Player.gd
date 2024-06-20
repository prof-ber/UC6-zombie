extends Sprite2D

var motion = Vector2()
var speed = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion = Vector2(0,0)
	speed = 4
	self.get_child(1).look_at(get_global_mouse_position())
	if (Input.is_action_pressed("Up")):
		motion.y = -1
	elif (Input.is_action_pressed("Down")):
		motion.y = 1
	if (Input.is_action_pressed("Left")):
		motion.x = -1
	elif (Input.is_action_pressed("Right")):
		motion.x = 1
	if (Input.is_action_pressed("Run")):
		speed *= 2
	if (Input.is_action_pressed("Shoot")):
		self.get_child(1).fire()
	self.global_position += motion * speed
