extends Line2D

signal drag_released

@export var node_drag_start: RigidBody2D

var mouse_drag_start = Vector2.ZERO
var mouse_drag_end = Vector2.ZERO
var drag_line_vector = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var launch_velocity = get_drag_vector()
	if launch_velocity.length() > 0:
		emit_signal("drag_released",launch_velocity)

func get_drag_vector():
	var velocity = Vector2.ZERO
	var drag_label = $Label
	if Input.is_action_just_pressed("ball_charge"):
		mouse_drag_start = get_global_mouse_position()
		add_point(node_drag_start.position)
		add_point(node_drag_start.position)
		drag_label.show()
	if Input.is_action_pressed("ball_charge"):
		mouse_drag_end = get_global_mouse_position()
		drag_line_vector = mouse_drag_end-mouse_drag_start
		set_point_position(points.size()-2,node_drag_start.position)
		set_point_position(points.size()-1,node_drag_start.position+drag_line_vector)
		drag_label.position = node_drag_start.position+drag_line_vector
		drag_label.text = str(int(drag_line_vector.length()))
	if Input.is_action_just_released("ball_charge"):
		clear_points()
		drag_label.hide()
		velocity = drag_line_vector
	return velocity
