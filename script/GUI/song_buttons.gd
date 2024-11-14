extends VBoxContainer

var button_list_script = load("res://script/GUI/list_buttons.gd")

func _ready() -> void:
	Signals.playlist_button_pressed.connect(load_playlist)
	
func load_playlist(data: Dictionary) -> void:
	for child in get_children():
		child.queue_free()
	var song_index = 0
	for i in data["song_data"]:
		var button = Button.new()
		button.set_script(button_list_script)
		button.set_text(i["name"])
		button.song_index = song_index
		song_index += 1

		add_child(button)
