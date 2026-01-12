extends CharacterBody2D

#Target node to follow
var target: CharacterBody2D

@export var speed = 100.0
@export var slow_distance = 50.0

var timer: Timer
var timeSurvived = 0
var speedMutliplier = 1

@export var time_between = 5
@export var mult = 0.01

func _ready() -> void:
	target = $"../Player"
	timer = $"../Timer"

func _process(delta: float) -> void:
	if target == null:
		return
	
	if position.x < -32.0:
		position.x = 1184.0
	if position.x > 1184.0:
		position.x = -32.0
	if position.y < -32.0:
		position.y = 680.0
	if position.y > 680.0:
		position.y = -32.0
	
	
	if global_position.distance_to(target.global_position) < slow_distance:
		speed -= 0.1
		if speed < speed * 0.7:
			speed = 0
	else:
		if speed < 100.0:
			speed += 0.1
	
	var direction = (target.global_position - global_position).normalized()
	position += direction * speed * speedMutliplier * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().quit()


func _on_enemy_timer_timeout() -> void:
	timeSurvived = timeSurvived + 1
	
	speedMutliplier += mult
	
	if timeSurvived % time_between == 0 && timeSurvived != 0:
		mult *= 2
	
	print(speedMutliplier)
