extends Node3D

@export var canDelete = true

func _ready():
	if canDelete:
		self.queue_free()
