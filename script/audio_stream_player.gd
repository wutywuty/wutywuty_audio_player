extends AudioStreamPlayer
## this node handles playing audio and deciding the next song to be played
var is_playlist_loaded: = false
var currently_loaded_playlist
var shuffle_play_enabled: = false
var song_index: = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.playback_toggled.connect(toggle_playback)
	Signals.song_play_requested.connect(play_song)
	Signals.playlist_button_pressed.connect(load_playlist)
	Signals.playlist_song_play_requested.connect(play_song_from_playlist)
	Signals.slider_dragged.connect(set_time)


func set_time(time_fraction):
	if stream == null:
		return
	if time_fraction >= 100:
		on_song_finish()
	else:
		seek(stream.get_length() * time_fraction / 100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_playing():
		Variables.playback_length_float = stream.get_length()
		Variables.playback_progress_float = get_playback_position()

func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound

func toggle_playback():
	set_stream_paused(not get_stream_paused())
	Variables.is_playing = is_playing()

func load_playlist(playlist_data):
	currently_loaded_playlist = playlist_data
	is_playlist_loaded = true
	song_index = 0

func play_song(song_data):
	Variables.song_name = song_data["name"]
	set_stream(load_mp3(song_data["path"]))
	toggle_playback()
	Variables.is_playing = true
	play()
	
func play_song_from_playlist(index):
	song_index = index
	play_song(currently_loaded_playlist["song_data"][song_index])


func pick_random_song():
	if len(currently_loaded_playlist["song_data"]) == 1:
		return 0
	var temp = range(0, len(currently_loaded_playlist["song_data"]))
	temp.remove_at(song_index)
	return temp[randi_range(0, len(temp) - 1)]
	
func on_song_finish():
	if not is_playlist_loaded:
		return
	if Variables.is_shuffling:
		play_song_from_playlist(pick_random_song())
	elif Variables.is_looping:
		play_song_from_playlist((song_index + 1) % len(currently_loaded_playlist["song_data"]))
	elif (song_index + 1) % len(currently_loaded_playlist["song_data"]) == 0:
		stop()
		Variables.is_playing = false
	else:
		play_song_from_playlist(song_index + 1)
