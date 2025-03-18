class_name PlayerState extends State;

const WALK_UP = "WALK_UP";
const WALK_RIGHT = "WALK_RIGHT";
const WALK_DOWN = "WALK_DOWN";
const WALK_LEFT = "WALK_LEFT";
const IDLE = "IDLE";

var player: Player

func _ready() -> void:
	await owner.ready;
	player = owner as Player;
	assert(player != null, "The PlayerState type must be a direct child of Player");
