extends DirectionalLight3D

var rotY
const  amount = .1

func _ready():
	rotY = rotation_degrees.y

func _on_timer_timeout():
	rotY-=amount
	rotation_degrees.y=rotY
