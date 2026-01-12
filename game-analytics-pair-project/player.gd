extends CharacterBody2D


var speed = 300.0
var multiplier = 0

func _process(delta: float) -> void:
	if position.x < -32.0:
		position.x = 1184.0
	if position.x > 1184.0:
		position.x = -32.0
	if position.y < -32.0:
		position.y = 680.0
	if position.y > 680.0:
		position.y = -32.0

func _physics_process(delta: float) -> void:
	var direction := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	
	velocity = direction * speed

	move_and_slide()

func increase_score() -> void:
	multiplier = multiplier + 1
	speed = 300 + 20 * multiplier
