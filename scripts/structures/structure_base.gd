class_name Structure extends StaticBody2D

@export var packed_scene: PackedScene 

var is_player_on_interaction_area: bool = false
var scene: CanvasLayer
const BODY: String = "Player"

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if is_player_on_interaction_area:
		if Input.is_action_just_pressed("ui_accept"):
			open_window()

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == BODY:
		is_player_on_interaction_area = true

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == BODY:
		is_player_on_interaction_area = false

func open_window():
	if !packed_scene:
		print("Error: No existe un tscn asignado a la estructura")
		return
	
	if scene:
		print("scene ya se encuentra instanciado")
		return

	scene = packed_scene.instantiate()
	get_tree().root.add_child(scene)
	
	scene.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	get_tree().paused = true
	scene.connect("window_closed", Callable(self, "_on_window_exit"))


func _on_window_exit():
	if scene:
		scene.queue_free()
