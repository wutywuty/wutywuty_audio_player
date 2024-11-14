extends FileDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.open_folder_clicked.connect(on_open_folder_clicked)

func on_open_folder_clicked():
	set_visible(true)



func _on_dir_selected(dir: String) -> void:
	Signals.playlist_directory_selected.emit(dir)
	print("hi")
