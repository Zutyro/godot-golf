extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_golfball_stroke_count_updated(0)  # Inicializace textu


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit_level"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")



func _on_golfball_stroke_count_updated(count: int) -> void:
	var text = "Strokes: %d" % count
	$StrokeLabel.text = text
	$FinalStroke.text = text
