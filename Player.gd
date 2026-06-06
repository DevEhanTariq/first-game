extends CharacterBody2D

@export var speed = 40000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("none", "none", "up", "down")
	velocity = input_direction * speed * delta
	move_and_slide()
