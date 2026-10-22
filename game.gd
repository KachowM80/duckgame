extends Node2D

@onready var duck_prefab = preload("res://duck.tscn")
@onready var score_label = $UI/Label
# variables
var score = 0

func _ready() -> void:
	score_label.text = "Score: 0"
# add score 
func add_score() -> void:
	score += 1
	score_label.text = "Score: " + str(score)

func _on_duck_spawn_timer_timeout() -> void:
	#spawn a duck
	randomize()
	var duck = duck_prefab.instantiate()
	duck.position = Vector2(randi_range(10, 1024), -50)
	duck.rotation = randf_range(0, 2 * PI)
	add_child(duck)
