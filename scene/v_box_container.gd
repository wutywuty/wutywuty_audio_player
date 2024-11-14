extends VBoxContainer

var playlist_list_script = load("res://script/GUI/playlist_list_buttons.gd")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_playlists()
	Signals.refresh_playlists.connect(get_playlists)

func get_playlists():
	for child in get_children():
		child.queue_free()
	var playlist_data_dir = DirAccess.open("user://")
	var file_list = playlist_data_dir.get_files()
	for i in file_list:
		var file = FileAccess.open("user://" + i, FileAccess.READ)
		var playlist_data = file.get_var()
		var button = Button.new()
		button.set_script(playlist_list_script)
		button.playlist_data = playlist_data
		add_child(button)
