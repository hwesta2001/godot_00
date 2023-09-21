extends Node3D

@export var cam_hight_speed = 30.0
@export var speed = 13.0
@export var cam_rotX_speed = 1.1
@export var cam_rotY_speed = 1.1
@onready var cam = $Camera3D

var rotX: float = 0
var rotY: float = 0

signal ray_cam_mouse(node:Node3D)

func _process(delta):
	var posy = position.y
	translate(move()*delta*speed)
	position.y=posy
	position.y = clampf(position.y,-1,20)
	moveUp(delta)

func moveUp(delta):
	var diry=position.y
	if Input.is_action_just_pressed("cam_up"):
		diry-=cam_hight_speed
	if Input.is_action_just_pressed("cam_down"):
		diry+=cam_hight_speed
		
	position.y=lerpf(position.y,diry,delta)
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
		rotX=clampf(rotX,-45,70)
		cam.rotation.x=deg_to_rad(rotX)
		rotation.y=deg_to_rad(rotY)


func _on_cam_ray_ray_mouse_pos(node):
	ray_cam_mouse.emit(node)
