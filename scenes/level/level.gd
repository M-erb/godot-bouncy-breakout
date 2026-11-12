class_name Level extends Node2D

@export var cols := 9
@export var rows := 8

signal lvlCleared

var brickCount:int = 0
var brickRef := preload("res://scenes/bricks/bricks.tscn")
var hardBrickRef := preload("res://scenes/bricks/hard_brick.tscn")
var bombBrickRef := preload("res://scenes/bricks/bomb_brick.tscn")
const TopLeftPos := Vector2(20, 20)
const HORZ := 20
const VERT := 10

func _ready() -> void:
	generateLvl()

func generateLvl() -> void:
	for row in rows:
		for col in cols:
			var brick: Brick = null
			
			if Global.lvls[Global.lvlIndex][row][col] == 'O':
				brick = brickRef.instantiate()
			
			if Global.lvls[Global.lvlIndex][row][col] == 'H':
				brick = hardBrickRef.instantiate()
			
			if Global.lvls[Global.lvlIndex][row][col] == 'B':
				brick = bombBrickRef.instantiate()
			
			if brick != null:
				brickCount += 1
				brick.distroyed.connect(brickDistroyed)
				var pos = TopLeftPos + Vector2(col * HORZ, row * VERT)
				brick.position = pos
				add_child(brick)
	
	print('brickCount count: ', brickCount)

func brickDistroyed() -> void:
	brickCount -= 1
	print('brickCount: ', brickCount)
	
	if brickCount <= 0:
		Global.lvlIndex += 1
		lvlCleared.emit()
