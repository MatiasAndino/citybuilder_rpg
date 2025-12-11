extends PanelContainer

const COLOR_SELECTED: Color = Color.MEDIUM_SEA_GREEN
const COLOR_DEFAULT: Color = Color("242424aa")

#var is_selected: bool = false:
	#set(value):
		#is_selected = value
	#get:
		#return is_selected

var stylebox_selected: StyleBoxFlat
var stylebox_default: StyleBoxFlat

func _ready() -> void:
	focus_mode = Control.FOCUS_ALL
	stylebox_selected = StyleBoxFlat.new()
	stylebox_selected.bg_color = COLOR_SELECTED
	stylebox_selected.set_border_width_all(1)
	stylebox_selected.set_corner_radius_all(3)
	stylebox_default = StyleBoxFlat.new()
	stylebox_default.bg_color = COLOR_DEFAULT
	stylebox_default.border_color = Color.TRANSPARENT
	stylebox_default.set_border_width_all(1)
	add_theme_stylebox_override("panel", stylebox_default)

func set_selected(value: bool) -> void:
	if value:
		add_theme_stylebox_override("panel", stylebox_selected)
	else:
		add_theme_stylebox_override("panel", stylebox_default)
		
