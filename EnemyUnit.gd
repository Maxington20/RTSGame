extends Unit

@export var detect_range : float = 100.0
@onready var game_manager = get_node("/root/Main")
@onready var start_position : Vector2 = global_position

func _process(delta):
	
	if target == null:
		for player in game_manager.players:
			if player == null:
				continue
			var dist = global_position.distance_to(player.global_position)
			
			if dist <= detect_range:
				set_target(player)
	else:
		for player in game_manager.players:
			if player == null:
				continue
			var dist = global_position.distance_to(player.global_position)
			
			if dist >= detect_range:
				move_to_location(start_position)
	_target_check()
