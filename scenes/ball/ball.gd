class_name Ball extends CharacterBody2D

@export var paddle: Paddle
@export var speed: float = 120.0

enum States {Docked, Flying}
var state: States = States.Docked

func _ready() -> void:
	var direction: Vector2 = Vector2(randf_range(-1, 1), -1).normalized()
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	if state == States.Flying:
		handleFly(delta)
	
	if state == States.Docked:
		handleDock()

func dock() -> void:
	state = States.Docked

func fly() -> void:
	state = States.Flying

func handleDock() -> void:
	if paddle:
		position = paddle.position + Vector2(0, -8)

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		state = States.Flying

func handleFly(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	
	if collision != null:
		var collider := collision.get_collider()
		var objNormal: Vector2 = collision.get_normal()
		
		if collider is Paddle: 
			var paddle: Paddle = collider
			velocity = getVelFromPaddle(paddle)
			return
		
		if collider is Brick:
			var brick: Brick = collider
			brick.takeDamage()
		
		# if no rules then just bounce normally
		velocity = velocity.bounce(objNormal)

func getVelFromPaddle(paddle: Paddle) -> Vector2:
	var paddingHalfWidth := 16
	var offset := (position.x - paddle.position.x) / paddingHalfWidth
	
	offset = clamp(offset, -1, 1)
	return Vector2(offset, -1).normalized() * speed
