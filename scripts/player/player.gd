extends CharacterBody2D

var state_machine: CallableStateMachine = null

@export var player_velocity: float = 8000.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

func _process(delta: float) -> void:
	_movement(delta)

func _movement(delta: float):
	velocity = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	) * player_velocity * delta
	
	_set_facing_direction(Input.get_axis("ui_left", "ui_right"))
	_run_animation()
	move_and_slide()

func _run_animation() -> void:
	if velocity == Vector2.ZERO:
		animation_player.stop()
		return
		
	_play_animation("walk")

func _set_facing_direction(x: float) -> void:
	if velocity.x == 0:
		return
		
	if abs(x) > 0:
		sprite.scale.x = 1 if (x < 0) else -1

func _play_animation(animation_name:String):
	if animation_name == "" or animation_player == null:
		return
	
	animation_player.play(animation_name)
