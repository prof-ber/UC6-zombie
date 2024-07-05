extends "res://Zombie.gd"

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
			self.explode()

func explode():
	##Criar o nó explosão
	var new_boom = Preloader.boom.instantiate()
	##Posicionar o nó
	new_boom.global_position = self.global_position
	##Adicionar à posição do zumbi
	get_tree().get_root().add_child(new_boom)
	##Eliminar o zumbi da cena
	self.queue_free()

func _on_timer_timeout():
	mordida_ready = true
	
func tomar_dano(quantidade):
	if not morto:
		self.vida -= quantidade
		if self.vida < 1:
			self.explode()
		else:
			$SomDano.play()
