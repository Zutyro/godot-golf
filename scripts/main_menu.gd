extends Control
@export var first_level: String = "res://scenes/level1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer2D.stream = preload("res://audio/Gentle Swing.mp3")
	$AudioStreamPlayer2D.max_distance = 500.0  # Maximální dosah zvuku
	$AudioStreamPlayer2D.play()
	$AnimationPlayer.play("XX")
	$LevelSelectGrid.hide()
	$LevelSelectBackButton.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(first_level)


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_level_select_button_pressed() -> void:
	$StartButton.hide()
	$LevelSelectButton.hide()
	$QuitButton.hide()
	$LevelSelectGrid.show()
	$LevelSelectBackButton.show()


func _on_level_pressed(level) -> void:
	get_tree().change_scene_to_file("res://scenes/level"+str(level)+".tscn")


func _on_level_select_back_button_pressed() -> void:
	$StartButton.show()
	$LevelSelectButton.show()
	$QuitButton.show()
	$LevelSelectGrid.hide()
	$LevelSelectBackButton.hide()
