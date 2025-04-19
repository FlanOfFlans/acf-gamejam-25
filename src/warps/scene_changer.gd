class_name Warp extends Node2D;

@export var level_scene_file: String = "";
@export var entry_point: String = "";

var warping: bool = false;

func _ready():
	ResourceLoader.load_threaded_request(level_scene_file);
	await get_parent().ready;
	
	assert(level_scene_file != null,
		"DoorTrigger '" + name +"' error: No level file provided. Did you forget to set it?");
	
	assert(entry_point != "",
		"DoorTrigger '" + name + "' error: No entry point provided.");

func warp():
	print("Warping...")
	warping = true;

func _process(_delta: float) -> void:
	if (warping):
		GameDataManager.toworld = level_scene_file;
		GameDataManager.entry_point = entry_point;
		var scene = ResourceLoader.load_threaded_get(level_scene_file);
		get_tree().change_scene_to_file(scene);


func waep() -> void:
	pass # Replace with function body.
