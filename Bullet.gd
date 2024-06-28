extends Sprite2D

@export var dano = 10
var speed = 24
var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2.RIGHT.rotated(deg_to_rad(self.rotation_degrees))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.global_position += speed * direction

func _on_lifetime_timeout():
	self.queue_free()

func _on_area_2d_body_entered(body):
	#quando o zumbi for atingido, tirar vida do zumbi
	if body.has_method("tomar_dano"):
		body.tomar_dano(self.dano)
	self.queue_free()
