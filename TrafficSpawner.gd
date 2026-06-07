extends Node

var x = 2000
var lanesY = [-300, 0, 300]

var allowCar = true
var cars = []
var carsAmountPerY = []

func spawn_car(lane, xCord):
	var sibling = get_parent().get_node("Traffic")
	var copy = sibling.duplicate()
	copy.position = Vector2(xCord,lanesY[lane])
	cars.append(copy)
	get_parent().add_child(copy)
		
func delete_oldest_road():
	pass
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_car(randi_range(0,2), 1500)
	
