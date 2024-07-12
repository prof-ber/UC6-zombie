extends Node2D

@export var dano = 100

var hit = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$SomBoom.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in $BlastRadius.get_overlapping_bodies():
		if body.has_method("tomar_dano") and body not in hit:
			print(body)
			body.tomar_dano(dano)
			hit.append(body)

func _on_lifetime_timeout():
	self.queue_free()
