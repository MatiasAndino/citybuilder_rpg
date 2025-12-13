extends CanvasLayer

@onready var box_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/PanelBody/VScrollBar/VBoxContainer
@onready var scroll_bar: ScrollContainer = $PanelContainer/MarginContainer/VBoxContainer/PanelBody/VScrollBar

const MISSION_PANEL = preload("uid://dy051fsdu7q05")

var index: int
var mission_array: Array
signal scene_closed

func _ready() -> void:
	index = 0
	_temp_gen_missions()
	
	if !mission_array.is_empty():
		mission_array[index].set_selected(true)
	
func _input(event):
	_input_cancel(event)
	
	if mission_array.is_empty():
		return
	
	_input_controls(event)
	_input_open_mission(event)
	
func _input_controls(event) -> void:
	if event.is_action_pressed("ui_down") and index < mission_array.size() - 1:
		index += 1
		_update_table()
	elif event.is_action_pressed("ui_up") and index >= 1:
		index -= 1
		_update_table()
		
func _input_open_mission(event) -> void:
	if event.is_action_pressed("ui_accept"):
		if !mission_array[index]:
			return
			
		var mission_panel = MISSION_PANEL.instantiate()
		SceneManager.open_scene(mission_panel)
		mission_panel.set_label("MISION " + str(index))
		
func _input_cancel(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		_close_window()
	
func _update_table() -> void:
	for item in mission_array:
		item.set_selected(false)
	
	mission_array[index].set_selected(true)
	mission_array[index].grab_focus()
	
func _close_window() -> void:
	emit_signal("scene_closed")

func _temp_gen_missions() -> void:
	#"res://scenes/ui/mission_table/mission/mission.tscn"
	
	for i in range(5):
		var mission = load("res://scenes/ui/mission_table/item_table/item_table.tscn").instantiate()
		mission_array.append(mission)
		box_container.add_child(mission)
