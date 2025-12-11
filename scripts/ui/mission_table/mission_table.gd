extends CanvasLayer


signal window_closed


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		close_window()


func close_window() -> void:
	get_tree().paused = false
	emit_signal("window_closed")
