extends CharacterBody2D

@export var lane = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lane = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.collision == false:
		if Input.is_action_just_pressed("up"):
			lane -= 1
		elif Input.is_action_just_pressed("down"):
			lane += 1
		
		if lane > 1:
			lane = 1
		elif lane < -1:
			lane = -1
		
		position.y = lane * 300
				
		Globals.playerCords = position
