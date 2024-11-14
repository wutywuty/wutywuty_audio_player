extends Node
## global variables
# i should probably move some of the methods into node scripts instead of having4
# them all randomly here
var playback_progress_float = 0.0
var playback_progress_int = 0
var playback_length_float = 1.0
var playback_length_int = 1
var song_name = ""
var is_playing: = false
var is_looping: = false
var is_shuffling: = false

func _process(_delta: float) -> void:
	playback_progress_int = roundi(playback_progress_float)
	playback_length_int = roundi(playback_length_float)

func get_audio_progress_string():
	var array = []
	var hours = str(playback_progress_int / 3600)
	var minutes = str((playback_progress_int % 3600) / 60)
	var seconds = str(playback_progress_int % 60)
	
	if not playback_length_int / 3600 == 0:
		array.append(hours)
	if len(minutes) < 2:
		minutes = minutes.insert(0, "0")
	array.append(minutes)
	if len(seconds) < 2:
		seconds = seconds.insert(0, "0")
	array.append(seconds)
	return ":".join(array)

func get_audio_progress_percentage():
	return playback_progress_float / playback_length_float * 100
	
func get_audio_length_string():
	var array = []
	var hours = str(playback_length_int / 3600)
	var minutes = str((playback_length_int % 3600) / 60)
	var seconds = str(playback_length_int % 60)
	
	if not playback_length_int / 3600 == 0:
		array.append(hours)
	if len(minutes) < 2:
		minutes = minutes.insert(0, "0")
	array.append(minutes)
	if len(seconds) < 2:
		seconds = seconds.insert(0, "0")
	array.append(seconds)
	return ":".join(array)

func get_song_name():
	pass
