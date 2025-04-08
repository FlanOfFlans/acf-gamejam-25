class_name Player extends CharacterBody2D

@onready var animation_player = %AnimationPlayer;
@onready var interaction_area = %InteractionArea;
@export var speed = 5.0; # Completely random number, TODO tune this

func _physics_process(delta: float) -> void:
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += input * speed * delta
	move_and_slide();
	
func interact():
	var areas = interaction_area.get_overlapping_areas();
			
	var filtered_areas: Array[Area2D] = areas.filter(func (area: Area2D):
			return area.is_in_group("interactable"));
	
	for area in filtered_areas:
		if not area.has_method("interact"):
			continue;
		
		area.call("interact", self);
