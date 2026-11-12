class_name Brick extends StaticBody2D

signal distroyed()

var isDead := false

func takeDamage() -> void:
	if !isDead:
		isDead = true
		self.distroyed.emit()
		queue_free()
