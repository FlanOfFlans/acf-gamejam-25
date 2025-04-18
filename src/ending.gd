extends Node2D

@onready var animation_player = %AnimationPlayer;

func try_ending(body: Node2D) -> void:
	if (body is Player):
		if (GameDataManager.tarot_cards.size() >= 8):
			(body as Player).can_move = false;
			animation_player.play("show_ending");
		else:
			pass # TODO Play a sound here or something
