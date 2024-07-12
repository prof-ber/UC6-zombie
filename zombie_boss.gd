extends "res://Zombie.gd"

signal morte_boss

func _ready():
	pass

func morrer():
	$Sprite2D.play("morrer")
	##Flag morto para verdadeiro
	self.morto = true
	$SomMorte.play()
	##Tirar a colisão
	self.remove_child($CollisionShape2D)
	$Sprite2D.z_index -= 1
	##Explodir o zumbi
	##Fazer a vitória acontecer
	morte_boss.emit()
