class_name BombBrick extends Brick

@onready var exploArea: Area2D = $ExplosionArea

func takeDamage() -> void:
	if !isDead:
		isDead = true
		self.distroyed.emit(self)
		explodNeighbors()
		queue_free()

func explodNeighbors() -> void:
	var bodies := exploArea.get_overlapping_bodies()
	
	for obj in bodies:
		if obj == self:
			continue

		if obj is Brick:
			var brick: Brick = obj
			
			if brick is BombBrick and brick.isDead == true:
				continue
			
			brick.takeDamage()
