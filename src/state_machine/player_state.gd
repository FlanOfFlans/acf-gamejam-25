class_name PlayerState extends State;

const WALK_UP = "WalkUp";
const WALK_RIGHT = "WalkRight";
const WALK_DOWN = "WalkDown";
const WALK_LEFT = "WalkLeft";
const IDLE = "Idle";

var player: Player

func _ready() -> void:
	await owner.ready;
	player = owner as Player;
	assert(player != null, "The PlayerState type must be a child of Player");
