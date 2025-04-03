extends Control

var usuario = ""

func _ready():
	var login_button = get_node_or_null("VBoxContainer/Entrar")
	var guest_button = get_node_or_null("VBoxContainer/Invitado")
 

	if login_button and login_button is Button:
		login_button.pressed.connect(_on_login_pressed)
	else:
		print("Error: No se encontró el botón 'Entrar'")

	if guest_button and guest_button is Button:
		guest_button.pressed.connect(_on_guest_pressed)
	else:
		print("Error: No se encontró el botón 'Invitado'")

func _on_login_pressed():
	usuario = $VBoxContainer/TextEdit.text
	if usuario.strip_edges() == "":  # Evita que se guarde un nombre vacío
		print("Error: Debes ingresar un nombre de usuario")
		return
	guardar_sesion(usuario)
	print("Usuario guardado:", usuario)
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_guest_pressed():
	usuario = "Invitado"
	guardar_sesion(usuario)
	print("Usuario guardado como invitado")
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func guardar_sesion(nombre):
	var file = FileAccess.open("user://session.txt", FileAccess.WRITE)
	file.store_string(nombre)
	file.close()
