extends CharacterBody2D

#Target node to follow
@export var target: CharacterBody2D

@export var speed = 100.0
@export var slow_distance = 50.0


func _process(delta: float) -> void:
	if target == null:
		return
		
	if global_position.distance_to(target.global_position) < slow_distance:
		speed -= 0.1
		if speed < speed * 0.7:
			speed = 0
	else:
		if speed < 100.0:
			speed += 0.1
	
	var direction = (target.global_position - global_position).normalized()
	position += direction * speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
