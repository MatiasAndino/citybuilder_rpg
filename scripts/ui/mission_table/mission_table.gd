extends CanvasLayer

@onready var box_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/PanelBody/VScrollBar/VBoxContainer
@onready var scroll_bar: ScrollContainer = $PanelContainer/MarginContainer/VBoxContainer/PanelBody/VScrollBar

var index: int
var mission_array: Array
signal window_closed

func _ready() -> void:
	index = 0
	mission_array = box_container.get_children()
	mission_array[index].set_selected(true)
	

func _input(event):
	_input_cancel(event)
	_input_controls(event)
	
func _input_controls(event) -> void:
	if event.is_action_pressed("ui_down") and index < mission_array.size() - 1:
		index += 1
		_update_table()
	elif event.is_action_pressed("ui_up") and index >= 1:
		index -= 1
		_update_table()
		
func _input_cancel(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		_close_window()
	
func _update_table() -> void:
	for item in mission_array:
		item.set_selected(false)
	
	mission_array[index].set_selected(true)
	mission_array[index].grab_focus()
	
func _close_window() -> void:
	get_tree().paused = false
	emit_signal("window_closed")
