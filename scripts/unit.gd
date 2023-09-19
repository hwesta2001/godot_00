extends Node3D

@onready var ray_cast_3d = $RayCast3D

signal rayHit(node:Node3D)

func _physics_process(_delta):
	if ray_cast_3d.is_colliding():
		DebugPanel.AddText("carpıyorrr")
	else:
		print("carpmıyoooor")
