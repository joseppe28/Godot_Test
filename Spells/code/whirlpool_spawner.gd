extends Node2D

var len
var height
var level = 1
@export var spell_name = "Whirlpool"
@export var max_level = 10
@export var size = 70
@export var number = 1
@export var damage = 10

var info = {
	"0": "Spawn Whirpools pulling in your enemies",
	"even": "damage +10%",
	"odd": "size +10% | number +1",
	"final": "master this spell"
}

func _ready():
	len = get_viewport().get_visible_rect().size.x
	height = get_viewport().get_visible_rect().size.y


func upgrade():
	level += 1
	if level % 2 == 0:
		damage += damage * 0.1
	else:
		size += size * 0.1
		number += 1


func _on_timer_timeout():
	for n in range(number):
		var spell = preload("res://Spells/whirlpool.tscn")
		var posx = randf_range(global_position.x-len/2, global_position.x+len/2)
		var posy = randf_range(global_position.y-height/2, global_position.y+height/2)
		spell = spell.instantiate()
		spell.position = Vector2(posx, posy)
		spell.size = size
		spell.damage = damage
		get_tree().current_scene.add_child(spell)
	$Timer.start()
