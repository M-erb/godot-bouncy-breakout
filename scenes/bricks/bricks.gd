class_name Brick extends StaticBody2D

@export var points := 10

signal distroyed(brick: Brick)

var isDead := false

func takeDamage() -> void:
	if !isDead:
		isDead = true
		self.distroyed.emit(self)
		queue_free()
