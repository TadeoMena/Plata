extends Node2D

@onready var grid := $VBoxContainer/CardGrid
@onready var btn_previa := $VBoxContainer/HBoxContainer/BtnVistaPrevia
@onready var btn_clasico := $VBoxContainer/HBoxContainer/BtnModoClasico

var cartas: Array = []
var primera_carta := null
var segunda_carta := null
var puede_jugar := false

func _ready():
	btn_previa.pressed.connect(() => iniciar_juego(true))
	btn_clasico.pressed.connect(() => iniciar_juego(false))

func iniciar_juego(con_vista_previa: bool):
	# Limpiar
	for c in grid.get_children():
		c.queue_free()
	cartas.clear()
	primera_carta = null
	segunda_carta = null

	# Preparar imágenes
	var imagenes := [
		preload("res://1.png"), preload("res://2.png"),
		preload("res://3.png"), preload("res://4.png"),
		preload("res://5.png"), preload("res://6.png"),
		preload("res://7.png"), preload("res://8.png")
	]

	imagenes = imagenes.duplicate()
	imagenes.shuffle()

	# Crear cartas
	for i in range(imagenes.size()):
		var carta = preload("res://scenes/games/Carta.tscn").instantiate()
		carta.imagen_frente = imagenes[i]
		carta.mostrar_reverso()
		carta.pressed.connect(() => carta_seleccionada(carta))
		grid.add_child(carta)
		cartas.append(carta)

	if con_vista_previa:
		for carta in cartas:
			carta.mostrar_frente()
		puede_jugar = false
		await get_tree().create_timer(3.0).timeout
		for carta in cartas:
			carta.mostrar_reverso()
		puede_jugar = true
	else:
		puede_jugar = true

func carta_seleccionada(carta):
	if not puede_jugar or carta.es_visible or carta.esta_pareada:
		return

	carta.mostrar_frente()

	if primera_carta == null:
		primera_carta = carta
	elif segunda_carta == null:
		segunda_carta = carta
		puede_jugar = false
		await get_tree().create_timer(1.0).timeout

		if primera_carta.imagen_frente == segunda_carta.imagen_frente:
			primera_carta.marcar_como_encontrada()
			segunda_carta.marcar_como_encontrada()
		else:
			primera_carta.mostrar_reverso()
			segunda_carta.mostrar_reverso()

		primera_carta = null
		segunda_carta = null
		puede_jugar = true
