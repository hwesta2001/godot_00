extends Node2D

@export var mapWight = 20
@export var mapHeight = 20
@export var tileXOffset = 60
@export var tileZOffset = 50
var tileHight = 30

func createGrid():
	tileHight = tileXOffset * .5
	for x in mapWight:
		for z in mapHeight:
				var tempGrid = preload("res://scenes/hex.tscn").instantiate()
				add_child(tempGrid)
				if z % 2 == 0:
					tempGrid.position = Vector2(x*tileXOffset,-z*tileZOffset)
				else :
					tempGrid.position = Vector2(x*tileXOffset+tileHight,-z*tileZOffset)
				#pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	createGrid()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
