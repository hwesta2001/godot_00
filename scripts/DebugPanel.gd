extends Control

@onready var timer = get_node("/root/DebugPanel/Timer")
@onready var richTextLabel = get_node("/root/DebugPanel/debugText")
@onready var move_steps = get_node("/root/DebugPanel/move_steps")

#Singleton

var allText = PackedStringArray([])
var maxArraySize = 15

func AddText(_text):
	allText.insert(0,_text)
	WriteText()
	if timer.is_stopped():
		timer.start()

func WriteText():
	if allText.size() > maxArraySize:
		allText.resize(maxArraySize)
	if !allText.is_empty():
		richTextLabel.text = "\n".join(allText)
	else:
		richTextLabel.text= ""
		timer.stop()

func _on_timer_timeout():
	if !allText.is_empty():
		allText.remove_at(allText.size()-1)
		WriteText()
		
func set_move_steps_text():
	move_steps.text=str(GLOBALS.MOVE_STEPS)
