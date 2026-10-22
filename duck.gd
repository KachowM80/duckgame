extends Area2D

var acceleration = 1.5
var velocity = 0.0
var rotation_velocity = randf_range(1.0, 3.0)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity += acceleration * delta
	position.y += velocity
	rotation += rotation_velocity * delta
# make duck disappear and detect player collision
func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_parent().add_score()
		queue_free()
		
