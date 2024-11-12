extends Node2D

var level = 1
var damage = 10
var number = 1
var max_level = 10
@export var spell_name = "Magic Sword"

var info = {
	"0": "A spell which shoots Magic Swords at your enemies",
	"odd": "number +1",
	"even": "damage +10%",
	"final": "master this spell"
}




func _on_timer_timeout():
	for n in range(number):
		var sword = preload("res://Bullets/sword.tscn")
		var angle = 0
		if len($Area2D.get_overlapping_bodies()) == 0:
			angle = randf_range(0, 2*PI)
		else:
			var ran = randi_range(0, len($Area2D.get_overlapping_bodies())-1)
			var enemy = $Area2D.get_overlapping_bodies()[ran]
			angle = get_angle_to(enemy.global_position)
		sword = sword.instantiate()
		sword.damage = damage
		sword.rotation = angle
		sword.position = global_position
		get_tree().current_scene.add_child(sword)
	$Timer.start()

func upgrade():
	level += 1
	if level % 2 == 0:
		damage += damage * 0.1
	else:
		number += 1
