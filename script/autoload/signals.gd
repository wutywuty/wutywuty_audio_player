extends Node

signal open_file_clicked() # import song button signal
signal playback_toggled() # toggle_playback button signal
signal open_folder_clicked() # import playlist button signal
signal song_play_requested(song_data) # song to be played from file
signal playlist_directory_selected(dir)
signal refresh_playlists() # 
signal playlist_button_pressed(playlist_data)
signal playlist_song_play_requested(song_index)
signal slider_dragged(time_percentage)
