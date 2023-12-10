extends Node

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		var menu = get_node_or_null("/root/Game/UI/pause_menu")
		if menu == null:
			get_tree().quit()
		else:
			if menu.visible:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
				get_tree().paused = false
				menu.hide()
			else:
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				get_tree().paused = true
				menu.show()
	
func reset():
	get_tree().paused = false
