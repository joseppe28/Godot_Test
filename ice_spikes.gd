extends Node2D

var level = 1
var max_level = 10
var damage = 10
@export var spell_name = "Ice Spikes"

var info = {
	"0": "Throw Ice Spikes at your Enemies",
	"even": "damage +15%",
	"odd": "Cooldown -5%",
	"final": "master this spell"
}

func _on_timer_timeout() -> void:
	var angle = randf_range(0.0, (2*PI))
	ice_spawn(angle)
	ice_spawn(angle - (PI/10))
	ice_spawn(angle + (PI/10))
	$Timer.start()

func ice_spawn(a):
	var ice = preload("res://Bullets/ice.tscn")
	ice = ice.instantiate()
	ice.global_position = global_position
	ice.rotation = a
	ice.damage = damage
	get_tree().current_scene.add_child(ice)
	
func upgrade():
	level += 1
	if level % 2 == 0:
		damage += damage * 0.15
	else:
		$Timer.wait_time -= $Timer.wait_time * 0.05
