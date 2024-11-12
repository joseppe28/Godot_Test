extends Node2D

var len
var height
var level = 1
@export var spell_name = "Earthquake"
@export var max_level = 7
@export var size = Vector2(1,1)
@export var number = 1
@export var damage = 10

var info = {
	"0": "Spawns a number of Earthquake to defeat your Enemies",
	"even": "damage +10%",
	"odd": "size +10% | number +1",
	"final": "master this spell",
	"seism": "Create an Earthquake whcih covers the whole screen \n Damage +20%",
	"Hell_Hole": "Create fire Earthquakes \n Damage +30% | Number -2",
	"Swarm": "Increase the speed and number of the Earthquakes\n Number +2 | Time -20%"
}

func _ready():
	len = get_viewport().get_visible_rect().size.x
	height = get_viewport().get_visible_rect().size.y


func upgrade():
	level += 1
	if level == max_level:
		PlayerManager.final(self)
		return
	if level % 2 == 0:
		damage += damage * 0.1
	else:
		size.x += size.x*0.1
		size.y += size.y*0.1
		number += 1


func _on_timer_timeout():
	for n in range(number):
		var spell = preload("res://Spells/earthquake_spawn.tscn")
		var posx = randf_range(global_position.x-len/2, global_position.x+len/2)
		var posy = randf_range(global_position.y-height/2, global_position.y+height/2)
		spell = spell.instantiate()
		spell.position = Vector2(posx, posy)
		spell.scale = size
		spell.damage = damage
		get_tree().current_scene.add_child(spell)
	$Timer.start()
