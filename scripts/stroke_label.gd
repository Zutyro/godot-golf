extends Label

func _ready():
	_on_golfball_stroke_count_updated(0)  # Inicializace textu

func _on_golfball_stroke_count_updated(count: int) -> void:
	text = "Strokes: %d" % count
