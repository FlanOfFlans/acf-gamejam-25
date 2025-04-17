class_name TarotCard extends Area2D

@export var card_name = "UNNAMED";

func _ready():
	if Engine.is_editor_hint(): return;
	
	if (GameDataManager.tarot_cards.has(card_name)):
		queue_free();

func collect():
	if Engine.is_editor_hint(): return;
	
	GameDataManager.tarot_cards.push_back(card_name);
	# TODO play a soudn effect here or something?
	queue_free();
