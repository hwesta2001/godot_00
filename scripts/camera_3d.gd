extends Camera3D

@export var speed = 14.0
@export var cam_hight_speed = 18.0
@export var cam_rotX_speed = 2.0

var rotX: float = 0

func _process(delta):
	position+=delta*speed*move()
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
	if Input.is_action_pressed("cam_up"):
		direction.y += 1
	if Input.is_action_pressed("cam_down"):
		direction.y -= 1
	return direction
	

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		rotX += event.relative.y * cam_rotX_speed
		rotX=clampf(rotX,-89,60)
		print(rotX)
		rotation.x=deg_to_rad(rotX)
