extends Node2D

var number = 1
var damage = 5
var size
var level = 1
var max_level = 10
@export var spell_name = "Poision Flask"

var info = {
	"0": "Throw a poisonous potion at your enemies",
	"odd": "number +1",
	"even": "damage +10%",
	"final": "master this spell"
}



func _on_timer_timeout():
	for n in range(number):
		var angle = randf_range(0, 2 * PI)
		var potion = preload("res://Bullets/potion.tscn")
		potion = potion.instantiate()
		potion.global_position = global_position
		potion.rotation = angle
		potion.damage = damage
		potion.size = size
		get_tree().current_scene.add_child(potion)
	$Timer.start()
		

func upgrade():
	level += 1
	if level % 2 == 0:
		damage += damage * 0.1
	else:
		number += 1
