extends Node

var HEXES: Array[Node3D]
var HEXES_POSITIONS: Array[Vector3]

func NearestHexPos(node_pos:Vector3):
	var _pos = HEXES_POSITIONS[0]
	var dist = node_pos.distance_squared_to(HEXES_POSITIONS[0])
	for x in HEXES_POSITIONS:
		if node_pos.distance_squared_to(x) < dist:
			_pos = x
			dist = node_pos.distance_squared_to(x)
	return _pos
