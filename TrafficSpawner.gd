extends Node

var x = 2000
var lanesY = [-300, 0, 300]

var allowCar = true
var cars = []
var carsAmountPerY = []

func spawn_car(amount, xCord):
	var PossibleLanes = [0,1,2]
	var leftLanes = []
	for k in range(amount):
		var switchLane = randi_range(0,PossibleLanes.size()-1)
		var currentLane = PossibleLanes[switchLane]
		for item in PossibleLanes:
			if not [currentLane].has(item):
				leftLanes.append(item)
		PossibleLanes = leftLanes
		
		var sibling = get_parent().get_node("Traffic")
		var copy = sibling.duplicate()
		copy.position = Vector2(xCord,lanesY[currentLane])
		cars.append(copy)
		get_parent().add_child(copy)
	carsAmountPerY.append(amount)
		
func delete_oldest_cars():
	if carsAmountPerY.size() > 4:
		for j in range(carsAmountPerY[0]):
			cars[0].queue_free()
		carsAmountPerY.queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_car(2, 1500)
	delete_oldest_cars()
	
