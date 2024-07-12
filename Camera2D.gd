extends Camera2D

@export var randomStrength: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()
var shaking = false
var shake_strength: float = 0.0

func apply_shake():
	shake_strength = randomStrength

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shaking:
		apply_shake()
		if shake_strength > 0:
			shake_strength = lerpf(shake_strength,0,shakeFade * delta)
			offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength), rng.randf_range(-shake_strength,shake_strength))

func _on_camera_timer_timeout():
	offset = Vector2(0,0)
	shaking = false
