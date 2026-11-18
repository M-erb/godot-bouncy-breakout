class_name LivesUI extends Control

var ballRef := preload("res://scenes/ui/ball_display.tscn")
var ballList: Array[Node2D] = []
const TopRightPos := Vector2(180, 10)
const HORZ := 148
const VERT := -2

func _ready() -> void:
	updateLives()

func updateLives() -> void:
	for ball in ballList:
		ball.queue_free()
	
	ballList.clear()
	
	for num in Global.lives:
		var ball = ballRef.instantiate()
		var pos = TopRightPos + Vector2((num * 8) - HORZ, VERT)
		ball.position = pos
		add_child(ball)
		ballList.append(ball)
