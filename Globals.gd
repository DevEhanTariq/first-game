extends Node


var score = 0
var collision = false
var speed_multiplier = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.score == 1:
		print("YAY")
	if Globals.score == 0:
		print("ahhhhh")
