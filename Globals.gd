extends Node


var score = 0
var highscore = 0

var collision = false
var speed_multiplier: float = 1.0
var playerCords = Vector2(0,0)
var difficulty = 0.0001


func speedLevels():
	if Globals.score == 7:
		Globals.difficulty = 0.00005
	if Globals.score == 15:
		Globals.difficulty = 0.0000015

func updateHigh():
	if collision and Globals.score > Globals.highscore:
		Globals.highscore = Globals.scored

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateHigh()
	Globals.speed_multiplier = Globals.difficulty*Globals.score + 1
	speedLevels()
	if Globals.collision:
		Globals.speed_multiplier = 0
		get_tree().change_scene_to_file("res://retrymenu.gd")
