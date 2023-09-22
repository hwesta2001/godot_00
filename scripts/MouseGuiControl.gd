extends Panel

@export_multiline var Not=" "
 
func _on_mouse_entered():
	GLOBALS.MOUSE_ON_GUI=true

func _on_mouse_exited():
	if not Rect2(Vector2(), size).has_point(get_local_mouse_position()):
		GLOBALS.MOUSE_ON_GUI=false
