extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Variables.song_name:
		text = Variables.song_name
	else: 
		text = "currently playing nothing"
