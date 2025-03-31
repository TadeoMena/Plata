extends Control

var historias = {
	"Juego1": "Historia del Juego 1...",
	"Juego2": "Historia del Juego 2...",
}

func mostrar_historia(juego):
	$RichTextLabel.text = historias.get(juego, "Historia no disponible")
