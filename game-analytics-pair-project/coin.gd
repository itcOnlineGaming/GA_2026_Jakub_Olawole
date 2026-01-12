extends StaticBody2D

var enemy = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.increase_score()
		position.x = randi() % 1052 + 50
		position.y = randi() % 548 + 50
		
		var enemy_instance = enemy.instantiate()
		enemy_instance.position = Vector2(randi() % 1052 + 50, randi() % 548 + 50)
		while enemy_instance.global_position.distance_to(body.global_position) < 300.0:
			#print("too close. redo")
			#print(enemy_instance.global_position.distance_to(body.global_position))
			enemy_instance.position = Vector2(randi() % 1052 + 50, randi() % 548 + 50)
		get_parent().add_child.call_deferred(enemy_instance)
	
