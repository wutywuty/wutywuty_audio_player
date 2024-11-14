extends Button

func _process(delta: float) -> void:
	if Variables.is_looping:
		set_text("loop enabled")
	else:
		set_text("loop disabled")


func _on_pressed() -> void:
	Variables.is_looping = not Variables.is_looping
	
