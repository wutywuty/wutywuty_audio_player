extends Button

var playlist_data
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_button_press)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = playlist_data["name"]

func _on_button_press():
	Signals.playlist_button_pressed.emit(playlist_data)
