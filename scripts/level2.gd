extends Node2D

func _ready():
	$AnimationPlayer2.play("Dravo")
	$AnimationPlayer.play("PohybDreva2")
	$AnimationPlayer3.play("otocka")
	$BombAnim.play("Bommba")
	$Stage1.stream = preload("res://audio/Infernal Swing.mp3")
	$Stage1.max_distance = 10000.0
	$Stage1.play()
