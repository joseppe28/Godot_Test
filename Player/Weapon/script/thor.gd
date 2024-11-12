extends Node2D

var damage = 5
var special_damage = 20

func _physics_process(delta):
	throw()
	


func throw():
	if Input.is_action_pressed("Special") and $shoot.is_stopped():
		# var angle = last_velocity.angle()
		var angle = get_angle_to(get_global_mouse_position())
		var l = preload("res://Bullets/lightning.tscn")
		l = l.instantiate()
		l.damage = damage
		l.rotation = angle
		l.global_position = global_position
		get_tree().current_scene.add_child(l)
		$shoot.start()
