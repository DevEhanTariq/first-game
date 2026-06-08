extends Node

var x = 2000
var lanesY = [-300, 0, 300]
var lane = [[0,1],[1,2],[0,2]]
var laneHistory = []

var allowCar = true
var cars = []
var speed = 500

func spawn_car(xCord):
	var lanesToUse = lane[randi_range(0,2)]
	if laneHistory != []:
		while lanesToUse == laneHistory:
			lanesToUse = lane[randi_range(0,2)]
	laneHistory = lanesToUse
	for i in range(2):
		if allowCar:
			var sibling = get_parent().get_node("Traffic")
			var copy = sibling.duplicate()
			cars.append(copy)
			copy.position = Vector2(xCord,lanesY[lanesToUse[i]])
			get_parent().add_child(copy)
	allowCar = false

func delete_oldest_cars():
	if cars[0].position.x < -1500:
		var oldest_cars = cars.pop_front()
		oldest_cars.queue_free()
		oldest_cars = cars.pop_front()
		oldest_cars.queue_free()
		Globals.score += 1

func CarPatternSpawner():
	if cars[-1].position.x < 800:
		allowCar = true

func moveCars(delta: float):
	for i in cars:
		speed = speed * Globals.speed_multiplier
		i.position.x -= speed * delta 
		
		
func checkCollision():
	for body in cars:
		if body.position.y == Globals.playerCords.y and body.position.x <= (Globals.playerCords.x) and body.position.x >= (Globals.playerCords.x - 500):
			Globals.collision = true
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_car(2000)
	CarPatternSpawner()
	delete_oldest_cars()
	moveCars(delta)
	checkCollision()
	
	
