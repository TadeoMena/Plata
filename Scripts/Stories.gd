extends Control

var historias = {
	"Juego1": "[center][b]Historia del Juego 1[/b]\nDesde tiempos antiguos, el tateti ha entretenido a generaciones.[/center]",
	"Juego2": "[center][b]Historia del Juego 2[/b]\nDurante la era digital, el tateti se adaptó a pantallas táctiles.[/center]",
	"Juego3": "[center][b]Historia del Juego 3[/b]\nHoy en día, sigue siendo un juego simple pero lleno de estrategia.[/center]",
	"Juego4": "[center][b]Historia del Juego 4[/b]\nOtra mirada al tateti, desde el arte hasta la educación.[/center]",
	"Juego5": """[center][b]🕰️ Historia del Tatetí (Tres en Línea)[/b][/center]

[b]🏛️ Orígenes antiguos[/b]
Aunque hoy lo conocemos como Tatetí o Tres en Línea, sus raíces se remontan a miles de años atrás. Ya en el Antiguo Egipto (alrededor del 1300 a.C.), se encontraron tableros tallados en piedra con una forma similar al juego, aunque se desconoce exactamente cómo se jugaba.

[b]🏺 Época romana[/b]
En el Imperio Romano, existía un juego llamado Terni Lapilli, que también se jugaba en una cuadrícula de 3x3, pero con un sistema ligeramente distinto: cada jugador tenía solo tres fichas, que movían por turnos. Era muy popular entre soldados y niños romanos.

[b]🧠 Nombre moderno: Tic-Tac-Toe[/b]
En el siglo XIX, en Inglaterra, el juego tomó la forma que conocemos hoy: dos jugadores, X y O, turnándose para marcar espacios en una cuadrícula de 3x3. Se lo llamó "Noughts and Crosses" (ceros y cruces).
Más tarde, en Estados Unidos, comenzó a llamarse Tic-Tac-Toe, nombre que hace referencia al sonido de los turnos rápidos.

[b]💻 Edad digital[/b]
Con la llegada de las computadoras en el siglo XX, Tatetí fue uno de los primeros juegos programados. En 1952, el científico británico Alexander S. Douglas creó una versión para computadora llamada OXO, considerada uno de los primeros videojuegos de la historia.

[b]📱 Tatetí hoy[/b]
Hoy el Tatetí se juega en todas partes del mundo: en hojas de papel, pizarras, apps, páginas web, videojuegos y hasta en proyectos de programación como el tuyo 😄. Es un clásico para aprender estrategias simples, lógica… ¡y también para divertirse en cualquier momento!
"""
}

func _ready():
	for boton in $ButtonContainer.get_children():
		if boton is Button:
			boton.pressed.connect(_on_button_pressed.bind(boton.name))

func _on_button_pressed(juego_nombre: String):
	var historia = historias.get(juego_nombre, "[center][i]Historia no disponible[/i][/center]")
	$RichTextLabel.text = historia
