class_name StateMachine extends Node;

@export var initial_state: State = null;

# Defines an anonymous function which will be called on ready
@onready var state: State = (func get_initial_state() -> State: 
	return initial_state if initial_state != null else get_child(0)
).call();

func _ready() -> void:
	for state_node: State in find_children("*", "State"):
		state_node.finished.connect(_transition_to_next_state)
	
	await owner.ready;
	state.enter("");

func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		printerr("%s: Trying to transition to state %s but it doesn't exist" % [
			owner.name,
			target_state_path
		]);
		return;
	
	var previous_state_path := state.name;
	state.exit();
	state = get_node(target_state_path);
	state.enter(previous_state_path, data);

func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event);

func _process(delta: float) -> void:
	state.update(delta);

func _physics_process(delta: float) -> void:
	state.physics_update(delta);
	
