extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Globals.collision = false
	Globals.speed_multiplier = 1.0



func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
