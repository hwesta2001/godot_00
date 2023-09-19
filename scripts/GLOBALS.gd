extends Node

var HEXES: Array[Node3D]
var HEXES_POSITIONS: Array[Vector3]

func NearestHexPos(node:Node3D):
	var pos = HEXES_POSITIONS[0]
	var dist = node.position.distance_squared_to(HEXES_POSITIONS[0])
	for x in HEXES_POSITIONS:
		if node.position.distance_squared_to(x) < dist:
			pos = x
			dist = node.position.distance_squared_to(x)
	return dist


