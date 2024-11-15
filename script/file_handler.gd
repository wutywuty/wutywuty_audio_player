extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.playlist_directory_selected.connect(save_playlist)

func save_playlist(dir):
	# gets the name of the directory (is there a better way??)
	var dir_fixed = dir.replace("\\", "/")
	var playlist_name = dir_fixed.split("/")[len(dir_fixed.split("/"))-1]
	var file = FileAccess.open("user://"+playlist_name, FileAccess.WRITE_READ)
	var playlist_dir = DirAccess.open(dir_fixed)
	var songs = playlist_dir.get_files()
	print(songs)
	var song_data = []
	var index = 0
	for song in songs:
		if not song.ends_with("mp3"):
			continue
		song_data.append({"index":index, "name":song,"path":dir_fixed+"/"+song})
		index += 1
	var playlist_data = {"name":playlist_name,"path":dir_fixed,"song_data":song_data}
	file.store_var(playlist_data)
	print(playlist_data)
	file.close()
	Signals.refresh_playlists.emit()
	
