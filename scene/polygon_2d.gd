extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var thing = [Vector2(0,0), Vector2(0, get_viewport_rect().end.y), Vector2(get_viewport_rect().end), Vector2(get_viewport_rect().end.x, 0)]
	set_polygon(PackedVector2Array(thing))
