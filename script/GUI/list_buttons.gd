extends Button

var song_index

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_button_press)
	set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	set_clip_text(true)
	set_custom_minimum_size(Vector2(0, 32))

func _on_button_press():
	Signals.playlist_song_play_requested.emit(song_index)
