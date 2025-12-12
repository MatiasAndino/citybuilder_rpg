@tool
extends Node

var scenes: Array

func open_scene(scene):
	if !scene:
		print("Error: scene es null")
		return
		
	if !scenes.is_empty():
		scenes.back().process_mode = Node.PROCESS_MODE_DISABLED
	
	scenes.append(scene)
	get_tree().root.add_child(scene)
	
	scene.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	get_tree().paused = true
	scene.connect("scene_closed", Callable(self, "_on_close_scene"))
	
func _on_close_scene() -> void:
	if !scenes.is_empty():
		scenes.back().queue_free()
		scenes.pop_back()
		
		if scenes.is_empty():
			get_tree().paused = false
		else:
			await get_tree().create_timer(0.01).timeout
			scenes.back().process_mode = Node.PROCESS_MODE_WHEN_PAUSED
