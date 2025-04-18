class_name Player extends CharacterBody2D

@onready var menuslot = %MenuSlot
@onready var animation_player = %AnimationPlayer;
@onready var interaction_area = %InteractionArea;
@export var speed = 600.0;

var pausemenu = "res://assets/scenes/pause_menu.tscn"
var can_move: bool = true;

func _ready() -> void:
	if (GameDataManager.entry_point != ""):
		var entry_point = get_parent().get_node(
			"Entry Points/" + GameDataManager.entry_point);
		if (entry_point != null):
			position = entry_point.position;

func _physics_process(_delta: float) -> void:
	if can_move:
		move_and_slide();
		GameDataManager.playercoords = position;
	
	if Input.is_action_just_pressed("pause"):
		if not GameDataManager.paused and can_move:
			openthemenu();
			
		elif GameDataManager.paused: 
			closethemenu();
	
func interact():
	var areas = interaction_area.get_overlapping_areas();
			
	var filtered_areas: Array[Area2D] = areas.filter(func (area: Area2D):
			return area.is_in_group("interactable"));
	
	for area in filtered_areas:
		if not area.has_method("interact"):
			continue;
		
		area.call("interact", self);

func closethemenu():
	can_move = true;
	for node in menuslot.get_children():
		menuslot.call_deferred("remove_child", node)
		node.queue_free()
		GameDataManager.paused = false

func openthemenu():
	can_move = false;
	var scenemenu = load(pausemenu)
	var instancemenu = scenemenu.instantiate()
	menuslot.add_child(instancemenu)
	GameDataManager.paused = true
