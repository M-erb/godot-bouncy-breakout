class_name HardBrick extends Brick

var health := 2
@onready var sprite: Sprite2D = $Sprite2D
@onready var breakAudio: AudioStreamPlayer = %BreakAudio

func takeDamage() -> void:
	health -= 1
	sprite.frame = 1
	breakAudio.play()
	
	if health <= 0 and !isDead:
		isDead = true
		self.distroyed.emit(self)
		queue_free()
