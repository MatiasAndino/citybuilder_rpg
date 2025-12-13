extends CanvasLayer

var index: int
var characters_array: Array
signal scene_closed

func _ready() -> void:
	index = 0
	_temp_gen_missions()
	
	if !characters_array.is_empty():
		characters_array[index].set_selected(true)
	
func _input(event):
	_input_cancel(event)
	
	if characters_array.is_empty():
		return
	
	_input_controls(event)
	_input_open_mission(event)
	
func _input_controls(event) -> void:
	if event.is_action_pressed("ui_down") and index < characters_array.size() - 1:
		index += 1
		_update_table()
	elif event.is_action_pressed("ui_up") and index >= 1:
		index -= 1
		_update_table()
		
func _input_open_mission(event) -> void:
	if event.is_action_pressed("ui_accept"):
		if !characters_array[index]:
			return
			

		
func _input_cancel(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		_close_window()
	
func _update_table() -> void:
	for item in characters_array:
		item.set_selected(false)
	
	characters_array[index].set_selected(true)
	characters_array[index].grab_focus()
	
func _close_window() -> void:
	emit_signal("scene_closed")

func _temp_gen_missions() -> void:
	#"res://scenes/ui/mission_table/mission/mission.tscn"
	pass
	#for i in range(0):
		#var mission = load("res://scenes/ui/mission_table/item_table/item_table.tscn").instantiate()
		#characters_array.append(mission)
		#box_container.add_child(mission)
