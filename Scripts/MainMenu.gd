extends Node2D

var scenes = {
	"Jugar": "res://scenes/GameSelection.tscn",
	"Historias": "res://scenes/Stories.tscn",
	"Inicio sesion": "res://scenes/Login.tscn"
}

func _ready():
	var container = $HBoxContainer  
	for button_name in scenes.keys():
		var button = container.get_node_or_null(button_name)  
		if button:
			button.pressed.connect(_on_button_pressed.bind(button_name))  
		else:
			print("Error: No se encontró el botón", button_name)

func _on_button_pressed(button_name):
	var scene_path = scenes.get(button_name, "")
	if scene_path:
		get_tree().change_scene_to_file(scene_path)
	else:
		print("Error: No se encontró la escena para", button_name)
