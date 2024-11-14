extends HSlider

var sliding: = false

func _process(_delta: float) -> void:
	if not sliding:
		set_value(Variables.get_audio_progress_percentage())
	



func _on_drag_started() -> void:
	sliding = true


func _on_drag_ended(value_changed: bool) -> void:
	Signals.slider_dragged.emit(get_value())
	sliding = false
