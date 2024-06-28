extends CharacterBody2D

@export var vida = 20
@export var forca = 10

var motion = Vector2()
var speed = 256
var mordida_ready = true

func _ready():
	$Sprite2D.play("default")

func _process(delta):
	var target_position = Vector2(INF,INF)
	var target = null
	##Encontrar o jogador mais próximo
	for w in self.get_parent().get_children():
		if w.name  == "Player":
			if target_position.distance_to(self.global_position) > w.global_position.distance_to(self.global_position):
				target_position = w.global_position
				target = w
	##Determinar para qual direção esse jogador está e atualizar a variável motion
	self.motion = self.global_position.direction_to(target_position)
	##Realizar o movimento
	if !self.global_position.distance_to(target.global_position) < 55.0:
		self.velocity = motion * speed
		move_and_slide()
	elif mordida_ready:
		self.bite(target)

func bite(target):
	##Executar uma animação de mordida
	$Sprite2D.play("bite")
	##Tocar um som
	$SomMordida.play()
	##Fazer o jogador tomar dano
	target.tomar_dano(self.forca)
	##Fazer a mordida entrar em cooldown
	mordida_ready = false
	$Timer.start()

func _on_timer_timeout():
	mordida_ready = true
	
func tomar_dano(dano):
	pass
