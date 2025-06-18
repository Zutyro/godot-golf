extends Area2D
@export var next_level_path: String
@onready var label := $"../UI/LevelComplete"  # Cesta k Labelu ve scéně
@onready var label2 := $"../UI/FinalStroke"  # Cesta k Labelu ve scéně


func _on_body_entered(body):
	if body.is_in_group("ball"):  # Předpokládá, že míček je v grupě "ball"
		print("Goal! Ball entered the hole!")
		body.can_move = false
		body.position = Vector2(0, 0)  # Reset pozice míčku
		body.linear_velocity = Vector2.ZERO  # Zastavení míčku
		label2.visible = true
		label.text = "Level Complete!"
		label.visible = true
		await get_tree().create_timer(1.5).timeout  # Počkej 2 sekundy
		body.reset_strokes()
		get_tree().change_scene_to_file(next_level_path)
