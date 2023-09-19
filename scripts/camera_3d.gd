extends Camera3D

@export var speed = 13.0
@export var cam_hight_speed = 15.0
@export var cam_rotX_speed = 1.1
@export var cam_rotY_speed = 1.1

var rotX: float = 0
var rotY: float = 0

func _process(delta):
	translate(move()*delta*speed)
	#moveUp(delta)


func moveUp(delta):
	if Input.is_action_pressed("cam_up"):
		if position.y<20:
			position.y += delta*cam_hight_speed
	if Input.is_action_pressed("cam_down"):
		if position.y>1:
			position.y -= delta*cam_hight_speed
	position.y = clampf(position.y,1,20)


func move():
	var direction: Vector3 = Vector3.ZERO
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.z += 1
	if Input.is_action_pressed("up"):
		direction.z -= 1
	return direction


func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		rotX -= event.relative.y * cam_rotX_speed
		rotY -= event.relative.x * cam_rotY_speed
		rotX=clampf(rotX,-89.99,60)
		rotation.x=deg_to_rad(rotX)
		rotation.y=deg_to_rad(rotY)
