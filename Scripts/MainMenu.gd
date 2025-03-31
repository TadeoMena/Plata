extends Control

# Función para el botón "Jugar"
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/GameSelection.tscn")

# Función para el botón "Historias"
func _on_stories_pressed():
	get_tree().change_scene_to_file("res://scenes/Stories.tscn")

# Función para el botón "Login"
func _on_login_pressed():
	get_tree().change_scene_to_file("res://scenes/Login.tscn")
