class_name Player extends CharacterBody2D

@onready var menuslot = $menuslot
@onready var animation_player = %AnimationPlayer;
@onready var interaction_area = %InteractionArea;
@export var speed = 5.0; # Completely random number, TODO tune this

var pausemenu = "res://assets/scenes/pause_menu.tscn"

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("pause"):
		if GameDataManager.paused == true:
			closethemenu()
		else:
			openthemenu()
	
	var input = Input.get_vector("left", "right", "up", "down")
	if GameDataManager.paused == false:
		position += input * speed * delta
	GameDataManager.playercoords = position
	move_and_slide();
	
func interact():
	var areas = interaction_area.get_overlapping_areas();
			
	var filtered_areas: Array[Area2D] = areas.filter(func (area: Area2D):
			return area.is_in_group("interactable"));
	
	for area in filtered_areas:
		if not area.has_method("interact"):
			continue;
		
		area.call("interact", self);

func closethemenu():
	print("fechatesesamo")
	for node in menuslot.get_children():
		menuslot.call_deferred("remove_child", node)
		node.queue_free()
		GameDataManager.paused = false

func openthemenu():
	print("abretesesamo")
	var scenemenu = load(pausemenu)
	var instancemenu = scenemenu.instantiate()
	menuslot.add_child(instancemenu)
	GameDataManager.paused = true
