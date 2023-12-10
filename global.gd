extends Node

var score = 0

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
	var Enemy_Container = get_node_or_null("/root/Game/Enemy_Container")
	if Enemy_Container != null:
		if Enemy_Container.get_child_count() == 0:
			get_tree().change_scene_to_file("res://UI/end_game.tscn")
	
func reset():
	get_tree().paused = false


func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD") 
	if hud != null:
		hud.update_score()
