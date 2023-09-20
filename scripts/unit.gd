extends Node3D

@onready var ray_cast_3d:RayCast3D = $ray3d
var hexUnder: Node3D
var collTick: bool
var nearestHexes: Array[Node3D]

func _ready():
	DebugPanel.AddText(str(ray_cast_3d.enabled))


func _physics_process(_delta):
	if ray_cast_3d.is_colliding():
		if collTick:
			collTick=false
			nearestHexes.clear()
			hexUnder=ray_cast_3d.get_collider().get_parent_node_3d()
			self.position=hexUnder.global_position
			nearestHexes=hexUnder.cast_now()
			greenHexes()
	else:
		if !collTick:
			hexUnder=null
			collTick=true
			clearHexes()


func RayCast():
	collTick = !collTick
	
func clearHexes():
	for i in nearestHexes:
		i.changeColor(Color.WHITE)
	nearestHexes.clear()

func greenHexes():
	for i in nearestHexes:
		i.changeColor(Color.LIGHT_GREEN)
	
