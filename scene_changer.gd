extends Area2D

@export var level_scene_file: String = ""

func _ready():
	assert(level_scene_file != "",
		"DoorTrigger '" + name +"' error: No level file provided. Did you forget to set it?")


func _on_area_entered(_area: Area2D):
	print("Something entered the DoorTrigger '" + name + "'")
	get_tree().change_scene_to_file(level_scene_file)
	
