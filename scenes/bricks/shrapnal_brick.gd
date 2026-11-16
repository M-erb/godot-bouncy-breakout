class_name ShrapnalBrick extends Brick

signal explode(pos: Vector2, ballNum: int)

@export var loadedBalls := 6

func takeDamage() -> void:
	if !isDead:
		isDead = true
		self.distroyed.emit()
		shootBalls()
		queue_free()

func shootBalls() -> void:
	explode.emit(position, loadedBalls)
