extends CharacterBody2D

@export var vida = 100
@export var forca = 10
@export var alcance_ataque = 55.0
@export var value = 100

var motion = Vector2()
@export var speed = 256
var mordida_ready = true
var morto = false

func _ready():
	pass

func _process(delta):
	if !morto:
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
		if target and !self.global_position.distance_to(target.global_position) < alcance_ataque:
			self.velocity = motion * speed
			if velocity:
				$Sprite2D.play("andando")
			if motion.x < 0:
				$Sprite2D.flip_h = true
			elif motion.x > 0:
				$Sprite2D.flip_h = false
			move_and_slide()
		elif target and mordida_ready:
			self.bite(target)

func bite(target):
	##Executar uma animação de mordida
	$Sprite2D.play("atacando")
	##Tocar um som
	$SomMordida.play()
	##Fazer o jogador tomar dano
	target.tomar_dano(self.forca)
	##Fazer a mordida entrar em cooldown
	mordida_ready = false
	$Timer.start()

func _on_timer_timeout():
	mordida_ready = true
	
func tomar_dano(quantidade):
	if not morto:
		self.vida -= quantidade
		if self.vida < 1:
			self.morrer()
		else:
			$SomDano.play()

func morrer():
	$Sprite2D.play("morrer")
	##Flag morto para verdadeiro
	self.morto = true
	$SomMorte.play()
	##Tirar a colisão
	self.remove_child($CollisionShape2D)
	$Sprite2D.z_index -= 1
	##Explodir o zumbi
	Preloader.score += self.value
