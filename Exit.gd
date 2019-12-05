extends Area2D

# exit world 1 and load world 2
export(String, FILE, "*.tscn") var world_scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(world_scene)