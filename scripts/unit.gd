extends Node3D

@onready var ray_cast_3d:RayCast3D = $ray3d
var hexUnder: Node3D
var nearestHexes: Array[Node3D]

func _on_timer_timeout():
	DebugPanel.AddText(str(ray_cast_3d.enabled))
	RayCast()
	if hexUnder!=null:
		position=hexUnder.position

func RayCast():
	ray_cast_3d.force_raycast_update()
	if ray_cast_3d.is_colliding():
		clearHexes()
		hexUnder=ray_cast_3d.get_collider().get_owner()
		nearestHexes=hexUnder.cast_now()
		GLOBALS.MOVABLE_HEX_GROUP=nearestHexes
		greenHexes()
	else:
		hexUnder=null
		clearHexes()
		GLOBALS.MOVABLE_HEX_GROUP.clear()


func clearHexes():
	for i in nearestHexes:
		i.changeColor(Color.WHITE)
	nearestHexes.clear()

func greenHexes():
	for i in nearestHexes:
		i.changeColor(Color.LIGHT_GREEN)

func _on_camera_3d_ray_cam_mouse(node):
	var pos = node.position
	var tween = get_tree().create_tween()
	tween.tween_property($".","position",pos,2).finished.emit()
	tween.tween_callback(RayCast)
