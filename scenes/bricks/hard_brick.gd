class_name HardBrick extends Brick

var health := 2
@onready var sprite: Sprite2D = $Sprite2D

func takeDamage() -> void:
	health -= 1
	sprite.frame = 1
	
	if health <= 0 and !isDead:
		isDead = true
		self.distroyed.emit()
		queue_free()
