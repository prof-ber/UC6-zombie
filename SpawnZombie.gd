extends Node2D

@export var ActiveRound = 1
var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_timer_timeout():
	if active:
		##Criar um zumbi
		var new_zombie = Preloader.zombie.instantiate()
		##Configurar a posição inicial do zumbi
		new_zombie.global_position = self.global_position
		##Adicionar o zumbi ao jogo
		get_tree().get_root().get_child(1).add_child(new_zombie)

func _on_rounds_round_change(round):
	if round >= self.ActiveRound:
		self.active = true
