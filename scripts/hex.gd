extends Node3D

@export var mapWight = 20
@export var mapHeight = 20
@export var tileXOffset = 1.75

var tileZOffset
var tileHight
var hex_prefab: PackedScene = preload("res://scenes/hex_prefab.tscn")

func createGrid():
	tileHight = tileXOffset * .5
	tileZOffset = sqrt(3)*tileHight
	GLOBALS.HEXES.clear()
	var hexes_node= Node3D.new()
	hexes_node.name="hexes_node"
	add_child(hexes_node)
	
	for x in mapWight:
		for z in mapHeight:
			var hex_node = hex_prefab.instantiate() as Node3D
			hex_node.name = "hex_"+str(x)+"_"+str(z)
			hexes_node.add_child(hex_node)
			if z % 2 == 0:
				hex_node.position = Vector3(x*tileXOffset,0,-z*tileZOffset)
			else:
				hex_node.position = Vector3(x*tileXOffset+tileHight,0,-z*tileZOffset)
			GLOBALS.HEXES.append(hex_node)
			GLOBALS.HEXES_POSITIONS.append(hex_node.position)

func _ready():
	createGrid()
	DebugPanel.AddText("Hexes Size: "+ str(GLOBALS.HEXES.size()))
	DebugPanel.AddText("Grid Size: "+ str(mapHeight*mapWight))
	
