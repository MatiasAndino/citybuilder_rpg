extends CanvasLayer

@onready var label: Label = $PanelContainer/Label

signal scene_closed

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_close_window()

func _close_window() -> void:
	emit_signal("scene_closed")

func set_label(_text) -> void:
	label.text = _text
