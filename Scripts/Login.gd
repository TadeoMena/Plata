extends Control

var usuario = ""

func _on_login_pressed():
	usuario = $TextEdit.text
	guardar_sesion(usuario)
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_guest_pressed():
	usuario = "Invitado"
	guardar_sesion(usuario)
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func guardar_sesion(nombre):
	var file = FileAccess.open("user://session.txt", FileAccess.WRITE)
	file.store_string(nombre)
	file.close()
