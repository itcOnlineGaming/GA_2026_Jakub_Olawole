extends CharacterBody2D


var speed = 300.0
var score = 0
var time_survived = 0

func _physics_process(delta: float) -> void:
	var direction := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	
	$CanvasLayer/PanelContainer/Label.text = " Time Survived: " + str(time_survived) + " seconds "
	
	velocity = direction * speed

	move_and_slide()

func increase_score() -> void:
	score = score + 1
	speed = 300 + 20 * score


func _on_timer_timeout() -> void:
	time_survived = time_survived + 1
	pass # Replace with function body.
