extends CanvasLayer


signal window_closed

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		close_window()

func close_window() -> void:
	get_tree().paused = false
	emit_signal("window_closed")
