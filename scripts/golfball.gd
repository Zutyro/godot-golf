extends RigidBody2D

signal stroke_count_updated(count: int)  # Signál pro aktualizaci UI

var initial_position: Vector2  # Počáteční pozice míčku
var shot_power = 0.0
var stroke_count = 0  # Počítadlo úderů
const MAX_POWER = 1000.0
const POWER_SCALE = 4
var can_move := true  # 🔒 Nová proměnná pro povolení pohybu

func _ready():
	add_to_group("ball")
	gravity_scale = 0.0
	linear_damp = 0.5
	angular_damp = 0.5
	initial_position = position
	emit_signal("stroke_count_updated", stroke_count)  # Inicializace UI
	print("Initial position set to: ", initial_position)

func strokes():
	print(stroke_count)

func reset_strokes():
	print(stroke_count)
	stroke_count = 0  # Reset počítadla
	emit_signal("stroke_count_updated", stroke_count)  # Aktualizace UI
	
func reset():
	can_move = false  # Zakáže pohyb během animace

	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.0, 0.0), 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

	await tween.finished

	position = initial_position
	linear_velocity = Vector2.ZERO
	angular_velocity = 0.0
	shot_power = 0.0

	# Reset velikosti zpět
	scale = Vector2.ONE
	can_move = true
	queue_redraw()
	print("Ball reset to: ", position)

func _on_drag_marker_drag_released(velocity) -> void:
	if not can_move:
		print("Movement disabled – ball can't be hit right now.")
		return
	
	var direction = -velocity.normalized() # Opak směru DragMarker
	shot_power = min(velocity.length() * POWER_SCALE, MAX_POWER)
	apply_impulse(direction * shot_power)
	stroke_count += 1  # Zvýšení počtu úderů
	$OdpalMicku.stream = preload("res://audio/odpalmicku.wav")
	$OdpalMicku.max_distance = 500.0  # Maximální dosah zvuku
	$OdpalMicku.play()
	emit_signal("stroke_count_updated", stroke_count)  # Aktualizace UI


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		return
	if body.is_in_group("wood"):
		$CollisionSound.stream = preload("res://audio/woodhit.mp3")
		$CollisionSound.play()
	if body.is_in_group("rock"):
		$CollisionSound.stream = preload("res://audio/rockhit.mp3")
		$CollisionSound.play()
