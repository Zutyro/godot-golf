extends StaticBody2D

var affected_body: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if affected_body != null:
		affected_body.gravity_scale = 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		affected_body = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("ball"):
		affected_body.gravity_scale = 0
		affected_body = null
