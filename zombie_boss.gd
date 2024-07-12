extends "res://Zombie.gd"

func _ready():
	pass

func morrer():
	Preloader.score += self.value
	$Sprite2D.play("morrer")
	##Flag morto para verdadeiro
	self.morto = true
	$SomMorte.play()
	##Tirar a colisão
	self.remove_child($CollisionShape2D)
	$Sprite2D.z_index -= 1
	##Explodir o zumbi
	##Fazer a vitória acontecer
	var player = get_tree().root.get_node("GameScene/Player")
	if player:
		player.vitoria = true
		player.add_child(Preloader.vitoria.instantiate())
