extends Node2D

var level = 1
var max_level = 10
var damage = 5

@export var spell_name = "Windblade"

var info = {
	"0": "Cast a blade of wind",
	"even": "Cooldown -5%",
	"odd": "damage +20%",
	"final": "master this spell"
}




func _on_timer_timeout():
	var angle = randf_range(0, 2 * PI)
	var wind = preload("res://Bullets/wind.tscn")
	wind = wind.instantiate()
	wind.global_position = global_position
	wind.rotation = angle
	wind.damage = damage
	get_tree().current_scene.add_child(wind)
	$Timer.start()

func upgrade():
	level += 1
	if level % 2 == 0:
		$Timer.wait_time -= $Timer.wait_time * 0.05
	else:
		damage += damage * 0.2
