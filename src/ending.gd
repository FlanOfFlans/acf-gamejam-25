extends Node2D

@export var can_end: bool = false;
@onready var animation_player = %AnimationPlayer;

func try_ending(body: Node2D) -> void:
	if (body is Player):
		if (GameDataManager.tarot_cards.size() >= 8):
			(body as Player).can_move = false;
			animation_player.play("show_ending");
		else:
			pass # TODO Play a sound here or something

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("pause")) and can_end:
		get_tree().quit();
