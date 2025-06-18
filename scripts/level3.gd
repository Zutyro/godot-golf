extends Node2D


func _ready() -> void:
	$Stage3.stream = preload("res://Audio/Galactic Swing.mp3")
	$Stage3.play()
