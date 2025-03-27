class_name Player extends CharacterBody2D

@onready var animation_player = %AnimationPlayer;
@export var speed = 5.0; # Completely random number, TODO tune this

func _physics_process(_delta: float) -> void:
	move_and_slide();
