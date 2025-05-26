extends TextureButton

var imagen_frente : Texture
var es_visible := false
var esta_pareada := false

func mostrar_frente():
	texture_normal = imagen_frente
	es_visible = true

func mostrar_reverso():
	texture_normal = preload("res://reversa.png")
	es_visible = false

func marcar_como_encontrada():
	esta_pareada = true
