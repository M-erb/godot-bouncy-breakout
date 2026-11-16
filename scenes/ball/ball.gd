class_name Ball extends CharacterBody2D

@export var paddle: Paddle
@export var speed: float = 130.0
@export var minAngle: float = 0.8
@export var isTemp: bool = false

enum States {Docked, Flying, Hidden}
var state: States = States.Docked

func _ready() -> void:
	setVelocity()
	
	if isTemp:
		self.modulate = Color('#009243')

func _physics_process(delta: float) -> void:
	if state == States.Flying:
		handleFly(delta)
	
	if state == States.Docked:
		handleDock()
	
	if state == States.Hidden:
		handleHide()

func setVelocity() -> void:
	var x: float = randf_range(-1, 1) if isTemp else 0
	var y: float = randf_range(-1, 1) if isTemp else -1
	var direction: Vector2 = Vector2(x, y).normalized()
	velocity = direction * speed

func dock() -> void:
	state = States.Docked

func fly() -> void:
	state = States.Flying

func hideMe() -> void:
	state = States.Hidden

func handleDock() -> void:
	if paddle:
		position = paddle.position + Vector2(0, -8)

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		state = States.Flying

func handleHide() -> void:
	position = Vector2(0, -100)

func handleFly(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	
	if collision != null:
		var collider := collision.get_collider()
		var objNormal: Vector2 = collision.get_normal()
		
		#if collider is Ball:
			#return
		
		if collider is Paddle: 
			var paddle: Paddle = collider
			velocity = getVelFromPaddle(paddle)
			return
		
		if collider is Brick:
			var brick: Brick = collider
			brick.takeDamage()
			velocity = velocity.bounce(objNormal)
			fixShallowAngle()
			return
		
		# if no rules then just bounce normally
		velocity = velocity.bounce(objNormal)

func fixShallowAngle() -> void:
	var direction := velocity.normalized()
	if direction.y > 0 and direction.y < minAngle:
		direction.y = minAngle
	elif direction.y < 0 and direction.y > -minAngle:
		direction.y = -minAngle
	
	velocity = direction * speed

func getVelFromPaddle(paddle: Paddle) -> Vector2:
	var paddingHalfWidth := 16
	var offset := (position.x - paddle.position.x) / paddingHalfWidth
	
	offset = clamp(offset, -1, 1)
	return Vector2(offset, -1).normalized() * speed
