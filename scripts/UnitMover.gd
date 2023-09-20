extends Node

@onready var unit = $"../unit"


func _on_camera_3d_ray_cam_mouse(node):
	var pos = node.position
	unit.set_position(pos)
	unit.RayCast()
