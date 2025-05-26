extends Node2D

var turno = "❌"
var terminado = false

func _ready():
	_resetear_juego()
	$ReiniciarButton.pressed.connect(_on_reiniciar_pressed)

func _resetear_juego():
	turno = "❌"
	terminado = false
	$ResultadoLabel.text = ""

	for i in 9:
		var boton = $GridContainer.get_node("Button" + str(i))
		boton.text = ""
		boton.disabled = false
		boton.remove_theme_color_override("font_color")

		if boton.pressed.is_connected(_on_cell_pressed):
			boton.pressed.disconnect(_on_cell_pressed)
		
		boton.pressed.connect(_on_cell_pressed.bind(boton))

func _on_cell_pressed(boton):
	if boton.text == "" and not terminado:
		boton.text = turno
		boton.disabled = true
		boton.add_theme_color_override("font_color", Color.RED if turno == "❌" else Color.BLUE)

		if revisar_ganador():
			terminado = true
			$ResultadoLabel.text = turno + " ganó! 🎉"
		elif revisar_empate():
			terminado = true
			$ResultadoLabel.text = "¡Empate! 😐"
		else:
			turno = "⭕" if turno == "❌" else "❌"

func revisar_ganador():
	var celdas = []
	for i in 9:
		celdas.append($GridContainer.get_node("Button" + str(i)).text)

	var combinaciones = [
		[0, 1, 2], [3, 4, 5], [6, 7, 8],
		[0, 3, 6], [1, 4, 7], [2, 5, 8],
		[0, 4, 8], [2, 4, 6]
	]

	for combo in combinaciones:
		var a = celdas[combo[0]]
		var b = celdas[combo[1]]
		var c = celdas[combo[2]]
		if a != "" and a == b and b == c:
			return true
	return false

func revisar_empate():
	for i in 9:
		var boton = $GridContainer.get_node("Button" + str(i))
		if boton.text == "":
			return false
	return true

func _on_reiniciar_pressed():
	_resetear_juego()
