extends Node2D

func _ready():
	$AnimationPlayer2.play("Dravo")
	$AnimationPlayer.play("PohybDreva2")
	$Stage1.stream = preload("res://Audio/Galactic Swing.mp3")
	$Stage1.max_distance = 10000.0
	$Stage1.play()
