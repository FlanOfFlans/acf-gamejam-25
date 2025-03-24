extends Interactable;

@onready var audio_player = %"AudioStreamPlayer"

func interact(_player: Player):
	audio_player.play();
