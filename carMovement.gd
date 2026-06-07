extends Sprite2D

@export var EnemySpeed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	region_rect = Rect2(0, (randi_range(0,3)*160), 400, 160)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
