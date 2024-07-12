extends "res://Gun.gd"

var rng = RandomNumberGenerator.new()
@export var imprecisao = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire():
	if pode_atirar:
		$Flash.visible = true
		$Flash/FlashTimer.start()
		var new_bullet = Preloader.bullet.instantiate()
		new_bullet.global_position = $Muzzle.global_position
		new_bullet.rotation_degrees = self.rotation_degrees
		new_bullet.rotation_degrees = self.rotation_degrees + rng.randf_range(-imprecisao, imprecisao)
		get_tree().get_root().add_child(new_bullet)
		$AudioStreamPlayer.play()
		pode_atirar = false
		$Ready.start()

func _on_ready_timeout():
	pode_atirar = true

func _on_flash_timer_timeout():
	$Flash.visible = false
