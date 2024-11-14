extends Button

func _process(delta: float) -> void:
	if Variables.is_shuffling:
		set_text("shuffle enabled")
	else:
		set_text("shuffle disabled")
		
func _on_pressed() -> void:
	Variables.is_shuffling = not Variables.is_shuffling
