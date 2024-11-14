extends FileDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.open_file_clicked.connect(on_open_file_clicked)

func on_open_file_clicked():
	set_visible(true)
	
func _on_file_selected(path: String) -> void:
	Signals.song_play_requested.emit(path, false)
