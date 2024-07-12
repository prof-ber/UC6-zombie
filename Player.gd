extends CharacterBody2D

@export var vida = 100
@export var stamina = 100
var motion = Vector2()
var speed = 256
var morto = false
var vitoria = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/LifeBar.value = self.vida
	$UI/StaminaBar.value = self.stamina

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI/Label.text = str(Preloader.score)
	if not morto and not vitoria:
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
		if (Input.is_action_pressed("Run") and stamina > 0):
			speed *= 1.5
			stamina -= 1
			$UI/StaminaBar.value = self.stamina
		if (Input.is_action_pressed("Shoot")):
			if $Camera2D/CameraTimer.is_stopped():
				$Camera2D.randomStrength = 2.5
				$Camera2D.shaking = true
				$Camera2D/CameraTimer.wait_time = 0.25
				$Camera2D/CameraTimer.start()
			self.get_child(1).fire()
		self.velocity = motion * speed
		if !motion:
			stamina += 0.1
			$UI/StaminaBar.value = self.stamina
		if motion.x < 0:
			$Sprite2D.flip_h = true
		elif motion.x > 0:
			$Sprite2D.flip_h = false
		if velocity:
			$Sprite2D.play("correndo")
		else:
			$Sprite2D.play("parado")
		move_and_slide()

func tomar_dano(quantidade):
	if not morto:
		if $Camera2D/CameraTimer.is_stopped():
			$Camera2D.randomStrength = 30.0
			$Camera2D.shaking = true
			$Camera2D/CameraTimer.wait_time = 0.5
			$Camera2D/CameraTimer.start()
		$SomDano.play()
		self.vida -= quantidade
		$UI/LifeBar.value = self.vida
		if self.vida < 1:
			self.morrer()

func morrer():
	self.morto = true
	$SomMorte.play()
	$Sprite2D.play("morrer")
	$Sprite2D.scale = Vector2(0.75,0.75)
	get_child(1).visible = false
	$Mochila.visible = true
	$GameOver.visible = true
	$GameOver/Timer.start()
