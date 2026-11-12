class_name LivesUI extends Control

var ballRef := preload("res://scenes/ui/ball_display.tscn")
var ballList: Array[Node2D] = []
const TopRightPos := Vector2(180, 10)
const HORZ := 145
const VERT := 1

func _ready() -> void:
	updateLives()

func updateLives() -> void:
	print('updateLives ballList: ', ballList)
	for ball in ballList:
		ball.queue_free()
	
	ballList.clear()
	
	print('updateLives: ', Global.lives)
	for num in Global.lives:
		var ball = ballRef.instantiate()
		print('ball sprite: ', ball)
		var pos = TopRightPos + Vector2((num * 8) - HORZ, VERT)
		ball.position = pos
		add_child(ball)
		ballList.append(ball)
