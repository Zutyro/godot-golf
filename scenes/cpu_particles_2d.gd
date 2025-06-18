extends CPUParticles2D

func _ready():
	randomize()
	apply_random_color()

func apply_random_color():
	# Vygeneruje náhodnou barvu
	var random_color = Color(randf(), randf(), randf(), 1.0)
	modulate = random_color
