extends Node2D

var time_survived = 0
var score = 0
var highscore = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/PanelContainer/Label.text = " Time Survived: " + str(time_survived) + " seconds "

func _on_timer_timeout() -> void:
	time_survived = time_survived + 1

func increase_score() -> void:
	score += 1

func calculate_highscore() -> void:
	highscore = time_survived * score
	$CanvasLayer/GameOver/Label.text = "Game Over\nTime Survived: " + str(time_survived) + " seconds\n\nHighscore = " + str(highscore)
