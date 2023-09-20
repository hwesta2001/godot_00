extends Node3D

var tempArray:Array[Node3D]
@onready var shape_cast_3d = $Area3D/ShapeCast3D
@onready var hex: MeshInstance3D = $hex/Cylinder


func cast_now():
	tempArray.clear()
	shape_cast_3d.force_shapecast_update()
	if shape_cast_3d.is_colliding():
		for i in shape_cast_3d.get_collision_count():
			tempArray.append(shape_cast_3d.get_collider(i).get_parent_node_3d())
			print(str(shape_cast_3d.get_collider(i).get_parent_node_3d().name))
	return tempArray

func changeColor(color:Color):
	var mat = hex.mesh.surface_get_material(0).duplicate()
	mat.set_albedo(color)
	hex.set_surface_override_material(0,mat)
	
