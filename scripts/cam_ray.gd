extends RayCast3D

@onready var camera_3d = $".."
@onready var mesh_instance_3d: Node3D = $MeshInstance3D
@onready var timer = $Timer

signal ray_mouse_pos(node:Node3D)

func _ready():
	mesh_instance_3d.visible=false
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var from = camera_3d.project_ray_origin(event.position)
		var to = from + camera_3d.project_ray_normal(event.position)
		mesh_instance_3d.visible=true
		timer.start()
		look_at(to)
		force_raycast_update()
		if is_colliding():
			var selected: Node3D = get_collider().get_owner()
			ray_mouse_pos.emit(selected)
			print(selected)


func _on_timer_timeout():
	mesh_instance_3d.visible=false
	timer.stop()
