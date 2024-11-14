extends Button

func _on_pressed() -> void:
	Signals.emit_signal("open_folder_clicked")
