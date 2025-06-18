extends Area2D


func _ready():
	# Připojení signálu body_entered
	connect("body_entered", Callable(self, "_on_body_entered"))


func _on_body_entered(body):
	if body.is_in_group("ball"):
		print("Ball entered DeathZone! Respawning!")
		body.reset()  # Reset míčku na počáteční pozici
