@tool
extends TextureRect

@export var speed: Vector3
var off: Vector3 = Vector3.ZERO

func _process(delta):
	off += speed * delta
	self.texture.noise.offset = off
