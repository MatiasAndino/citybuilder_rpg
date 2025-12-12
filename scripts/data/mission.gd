class_name Mission

# diccionario que retorne el frame de acuerdo al tipo de mision.
const mission_sprites = {
	"fight": 0,
	"exploration": 1,
	"recolection": 2,
}
var name: String:
	set(_name):
		name = _name
	get:
		return name
		
var type: String:
	set(_type):
		type = _type
	get:
		return type
var description: String:
	set(_description):
		description = _description
	get:
		return description
var cost: int:
	set(_cost):
		cost = _cost
	get:
		return cost

func _init(_name: String, _type: String, _description: String, _cost: int) -> void:
	name = _name
	type = _type
	description = _description
	cost = _cost

func set_name(_name: String) -> void:
	name = _name

func set_type(_type: String) -> void:
	type = _type

func set_description(_description: String) -> void:
	description = _description

func set_cost(_cost: int) -> void:
	cost = _cost
	
func get_name() -> String:
	return name

func get_type() -> String:
	return type

func get_description() -> String:
	return description

func get_cost() -> int:
	return cost
