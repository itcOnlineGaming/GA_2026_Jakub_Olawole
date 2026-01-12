extends Node2D

var player_data = []

var time_survived = 0
var score = 0
var highscore = 0

var condition = "B"
@export var time_between = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randi() % 2 == 0:
		condition = "A"
		time_between = 4
	else:
		condition = "B"
		time_between = 8

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
	save_to_csv()

func save_to_csv():
	var file_path = "res://ab_test_results.csv"
	var file: FileAccess
	# If file does not exist, create it
	if not FileAccess.file_exists(file_path):
		file = FileAccess.open(file_path, FileAccess.WRITE)
		file.store_line("timestamp,condition,time between,highscore")
	else:
		file = FileAccess.open(file_path, FileAccess.READ_WRITE)
		file.seek_end()
	var timestamp = Time.get_datetime_string_from_system()
	var line = "%s,%s,%s,%.2f" % [
		timestamp,
		condition,
		str(time_between),
		highscore
		]
	file.store_line(line)
	file.close()
	print("A/B result saved:", line)
