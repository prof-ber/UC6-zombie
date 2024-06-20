extends Sprite2D

var speed = 32
var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2.RIGHT.rotated(deg_to_rad(self.rotation_degrees))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.global_position += speed * direction
