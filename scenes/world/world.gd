class_name World extends Node2D

@export var ball: Ball
@export var Bottom: Area2D
@export var animation: AnimationPlayer
@export var mssgLabel: Label
@export var lvl: Level
@export var livesUI: LivesUI

func _ready() -> void:
	if Bottom: Bottom.body_entered.connect(onBottomEntered)
	if lvl: lvl.lvlCleared.connect(handleLvlCleared)

func onBottomEntered(body: Node2D) -> void:
	if body is Ball:
		Global.lives -= 1
		livesUI.updateLives()
		
		if Global.lives == 0:
			handleShowMssg('Game Over!')
		else:
			# set random message
			var msgIndex: int = randi_range(0, Global.loseMsgs.size() - 1)
			var mssg: String = Global.loseMsgs[msgIndex]
			
			await handleShowMssg(mssg)
			
			# wait till after animation to reset-ball
			ball.dock()

func handleShowMssg(txt: String, color: Color = Color('#f7aef3')) -> Signal:
	if mssgLabel:
		mssgLabel.text = txt
		mssgLabel.add_theme_color_override('font_color', color)
	
	animation.play('showMssg')
	return animation.animation_finished

func handleLvlCleared() -> void:
	ball.hideMe()
	
	await handleShowMssg('Cleared!', Color(0.098, 0.769, 0.098, 1.0))
	
	if Global.isWin():
		handleShowMssg('You Win!', Color(0.098, 0.769, 0.098, 1.0))
	else:
		lvl.generateLvl()
		ball.dock()
