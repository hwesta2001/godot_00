extends Node3D

@onready var ray_cast_3d:RayCast3D = $ray3d

signal rayHit(node:Node3D)
var collTick: bool

func _ready():
	DebugPanel.AddText(str(ray_cast_3d.enabled))
	
func _physics_process(_delta):
	if ray_cast_3d.is_colliding():
		if collTick:
			collTick=false
			print("AHA CArpıyorrr")
	else:
		if !collTick:
			collTick=true
			print("carpmıyoooor")

func _process(delta):
	move(delta)
	
	
func move(delta):
	if Input.is_action_pressed("cam_up"):
		if position.y<10:
			position.y += delta*10
	if Input.is_action_pressed("cam_down"):
		if position.y>-0.001:
			position.y -= delta*10
	position.y = clampf(position.y,0.001,10)
	
	if Input.is_action_just_pressed("fire"):
		collTick = !collTick
