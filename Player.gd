extends CharacterBody2D

@export var lane = 0
@export var laneChangeRate = 0.25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("none", "none", "up", "down")
	if input_direction[1] != 0:
		lane += input_direction[1]/laneChangeRate * delta
		var nLane = round(lane)
	
		if nLane > 1:
			lane = 1
		elif nLane < -1:
			lane = -1
	
		if nLane == -1:
			position.y = -300
		elif nLane == 0:
			position.y = 0
		elif nLane == 1:
			position.y = 300
