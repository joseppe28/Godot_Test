extends Node


var max_health = 10
var health = max_health
var player
var exp = 0
var next_level = 10
var weapon
var killCount = 0
var time = 0
var diff = 1

func get_Arena():
	var scene = get_tree().root.get_node("/root/Arena")
	return scene

func get_Player():
	if not player:
		player = get_tree().current_scene.get_node("/root/Arena/Player")
	return player

func level_up(spell):
	get_Player()
	if not exist(spell.name):
		player.add_child(spell)
	else:
		player.get_index()
		spell = player.get_node("" + spell.name)
		spell.upgrade()

func exist(name):
	for child in player.get_children():
		if child.name == name:
			return true
	return false

func final(spell):
	var spells = preload("res://UI/Final_Selection.tscn")
	spells = spells.instantiate()
	spells.spell = spell
	add_child(spells)
	get_tree().paused = true

func reset():
	killCount = 0
	time = 0
	health = max_health
	exp = 0
	next_level = 10

#func deactivate(s):
#	s.hide()
#	for c in s.get_children() :
#		if c is CollisionShape2D:
#			call_deferred("disable", c)
#		if not c is Timer:
#			c.hide()

func disable(c):
	c.disabled = true

func deactivate(s):
	s.queue_free()
