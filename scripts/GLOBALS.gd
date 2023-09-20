extends Node

var HEXES: Array[Node3D]
var HEXES_POSITIONS: Array[Vector3]
var MOVE_STEPS: int

func NearestHexPos(node_pos:Vector3):
	var _pos = HEXES_POSITIONS[0]
	var dist = node_pos.distance_squared_to(HEXES_POSITIONS[0])
	for x in HEXES_POSITIONS:
		if node_pos.distance_squared_to(x) < dist:
			_pos = x
			dist = node_pos.distance_squared_to(x)
	return _pos

func set_move_steps_random(_max:int):
	MOVE_STEPS=randi_range(1,_max)
	DebugPanel.set_move_steps_text()

func set_move_steps(amount:int):
	MOVE_STEPS+=amount
	DebugPanel.set_move_steps_text()

func _ready():
	set_move_steps_random(10)
