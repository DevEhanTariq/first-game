extends Node


var score = 0
var collision = false
var speed_multiplier: float = 1.0
var playerCords = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Globals.speed_multiplier = 0.0001*Globals.score + 1
	print(Globals.speed_multiplier)
	if Globals.collision:
		Globals.speed_multiplier = 0
