extends Node2D

var screen_size 
var card_held
func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	if card_held:
		var mouse_pos = get_global_mouse_position()
		card_held.position = Vector2(clamp(mouse_pos.x, 0, screen_size.x), clamp(mouse_pos.y, 0, screen_size.y))
		print(card_held.position)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var card = rc_for_pressed_card()
				if card:
					card_held = card
			else:
				card_held = null

func rc_for_pressed_card():
	var space_state = get_world_2d().direct_space_state
	var par = PhysicsPointQueryParameters2D.new()
	par.position = get_global_mouse_position()
	par.collide_with_areas = true
	par.collision_mask = 1
	var result = space_state.intersect_point(par)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null
