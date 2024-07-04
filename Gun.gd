extends Sprite2D

var power
var pode_atirar = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire():
	##Criar uma bala
	var new_bullet = Preloader.bullet.instantiate()
	##Configurar a posição inicial da bala
	new_bullet.global_position = self.global_position
	##Configurar a direção da bala
	new_bullet.rotation_degrees = self.rotation_degrees
	##Tocar um som
	$AudioStreamPlayer.play()
	##Adicionar a bala ao jogo
	get_tree().get_root().add_child(new_bullet)
