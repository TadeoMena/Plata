extends Control

func _on_game_1_pressed():
	get_tree().change_scene_to_file("res://scenes/games/Game1.tscn")

func _on_game_2_pressed():
	get_tree().change_scene_to_file("res://scenes/games/Game2.tscn")

func _on_tateti_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/games/Game5Tateti.tscn")
