class_name Structure extends StaticBody2D

@export var packed_scene: PackedScene 

var is_player_on_interaction_area: bool = false
var scene: CanvasLayer
const BODY: String = "Player"

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if is_player_on_interaction_area:
		if Input.is_action_just_pressed("ui_accept"):
			open_scene()

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == BODY:
		is_player_on_interaction_area = true

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == BODY:
		is_player_on_interaction_area = false

func open_scene():
	scene = packed_scene.instantiate()
	
	SceneManager.open_scene(scene)
