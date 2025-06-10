extends RigidBody2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_drag_marker_drag_released(velocity) -> void:
	apply_impulse(-velocity*2)
