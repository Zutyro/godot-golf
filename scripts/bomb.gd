extends Area2D

const EXPLOSION_FORCE = 1000.0
var exploded = false
var initial_position: Vector2

@onready var collision := $CollisionShape2D

func _ready():
	initial_position = position
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if exploded or not body.is_in_group("ball"):
		return

	exploded = true
	print("Boom! Ball triggered the bomb!")
	$Exploze.play("Exploze")
	$BombSound.stream = preload("res://Audio/521105_6142149-lq.ogg")
	$BombSound.max_distance = 500.0
	$BombSound.play()

	var direction = (body.position - position).normalized()
	body.apply_impulse(direction * EXPLOSION_FORCE)

	hide()
	collision.set_deferred("disabled", true)

	await get_tree().create_timer(2.0).timeout
	respawn()

func respawn():
	position = initial_position
	modulate.a = 0.0  # Začneme neviditelní
	show()
	
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.5).from(0.0)  # Fade-in
	
	$CollisionShape2D.set_deferred("disabled", false)
	exploded = false
