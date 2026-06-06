extends Node2D

var allowRoad = true
var defaultPos = 2000
var roadLength = 2000
var road = 0

var new_road: Sprite2D

func delete_after_delay(node: Node, delay: float):
	await get_tree().create_timer(delay).timeout
	if is_instance_valid(node):
		node.queue_free()

func spawn_road():
	if allowRoad:
		allowRoad = false
		new_road = $Road.duplicate()
		add_child(new_road)
		new_road.position = Vector2((defaultPos + (roadLength*road))-500, 0)
		delete_after_delay(new_road, 5.0)
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_float):
	spawn_road()
	var latestRoadPos = new_road.position[0]
	if latestRoadPos <= (roadLength):
		allowRoad = true
		road = 0
		spawn_road()
		allowRoad = true
		road = 1
		spawn_road()
