extends Button

func _process(delta: float) -> void:
	if Variables.is_playing:
		set_text("playing")
	else:
		set_text("stopped")

func _on_pressed() -> void:
	Signals.emit_signal("playback_toggled")
