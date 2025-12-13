extends CanvasLayer

@onready var container: GridContainer = $PanelContainer/MarginContainer/ScrollContainer/GridContainer


var index: Vector2i
var characters_array: Array
signal scene_closed

const card_sizes = {
	"small": 4,
	"medium": 3
}
func _ready() -> void:
	index = Vector2i.ZERO
	_temp_gen_characters()
	
	if !characters_array.is_empty():
		var current_index: int = _get_index()
		characters_array[current_index].set_selected(true)
	
func _input(event):
	_input_cancel(event)
	
	if characters_array.is_empty():
		return
	
	_input_controls(event)
	
func _input_controls(event) -> void:
	if event.is_action_pressed("ui_down"):
		@warning_ignore("integer_division")
		var rows: int = floor(characters_array.size() / card_sizes.small)
		
		if index.y >= rows:
			return
			
		if _get_direction_offset(Vector2i.DOWN) >= characters_array.size():
			var rest = floor(characters_array.size() % card_sizes.small) - 1
			if rest != -1:
				index = Vector2i(rest, rows) 
		else:
			index += Vector2i.DOWN
		
		_update_table()
	elif event.is_action_pressed("ui_up") and index.y >= 1:
		index += Vector2i.UP
		_update_table()
	elif event.is_action_pressed("ui_left") and index.x >= 1:
		index += Vector2i.LEFT
		_update_table()
	#elif event.is_action_pressed("ui_right") and index.x < card_sizes.small - 1 and _get_index() < characters_array.size() - 1:
	elif event.is_action_pressed("ui_right"):
		
		if index.x >= card_sizes.small - 1:
			return
			
		if _get_index() >= characters_array.size() - 1:
			return
			
		index += Vector2i.RIGHT
		_update_table()
		

func _input_cancel(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		_close_window()
	
func _update_table() -> void:
	for item in characters_array:
		item.set_selected(false)
	
	var current_index: int = _get_index()
	if current_index >= characters_array.size():
		return
	characters_array[current_index].set_selected(true)
	characters_array[current_index].grab_focus()
	
func _close_window() -> void:
	emit_signal("scene_closed")

func _temp_gen_characters() -> void:
	characters_array = container.get_children()
	
	#"res://scenes/ui/mission_table/mission/mission.tscn"
	pass
	#for i in range(0):
		#var mission = load("res://scenes/ui/mission_table/item_table/item_table.tscn").instantiate()
		#characters_array.append(mission)
		#box_container.add_child(mission)

func _get_index() -> int:
	return (index.y * card_sizes.small) + index.x
	
func _get_direction_offset(value: Vector2i) -> int:
	var index_offset: Vector2i = index + value
	return (index_offset.y * card_sizes.small) + index_offset.x
	
