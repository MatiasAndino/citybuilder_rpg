extends PanelContainer

const UI_FRAME_LIST_ELEMENTS = preload("uid://cxcau1fla27g0")
const UI_FRAME_LIST_ELEMENTS_SELECTED = preload("uid://o2ybb555g480")

func _ready() -> void:
	focus_mode = Control.FOCUS_ALL
	add_theme_stylebox_override("panel", UI_FRAME_LIST_ELEMENTS)

func set_selected(value: bool) -> void:
	if value:
		add_theme_stylebox_override("panel", UI_FRAME_LIST_ELEMENTS_SELECTED)
	else:
		add_theme_stylebox_override("panel", UI_FRAME_LIST_ELEMENTS)
