extends CharacterBody2D

@export var vida = 100
var motion = Vector2()
var speed = 256
var morto = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not morto:
		motion = Vector2(0,0)
		speed = 256
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
		self.velocity = motion * speed
		move_and_slide()

func tomar_dano(quantidade):
	self.vida -= quantidade
	if self.vida < 1:
		self.morrer()

func morrer():
	print("morri!")
	self.morto = true
