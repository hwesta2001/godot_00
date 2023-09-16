extends Node3D

@export var mapWight = 20
@export var mapHeight = 20
@export var tileXOffset = 1.75
var tileZOffset
var tileHight
var tempGrid: PackedScene = preload("res://scenes/hex_prefab.tscn")

func createGrid():
	tileHight = tileXOffset * .5
	tileZOffset = sqrt(3)*tileHight
	for x in mapWight:
		for z in mapHeight:
				var temp = tempGrid.instantiate()
				add_child(temp)
				if z % 2 == 0:
					temp.position = Vector3(x*tileXOffset,0,-z*tileZOffset)
				else :
					temp.position = Vector3(x*tileXOffset+tileHight,0,-z*tileZOffset)

func _ready():
	createGrid()
