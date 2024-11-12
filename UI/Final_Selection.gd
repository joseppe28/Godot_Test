extends CanvasLayer

var spell
var final1
var final2
var final3
var info
var player = PlayerManager.get_Player()

func _ready():
	info = spell.info.keys()
	final1 = info[len(info) -3]
	final2 = info[len(info) -2]
	final3 = info[len(info) -1]
	
	$Final1.text = final1
	$Final2.text = final2
	$Final3.text = final3
	
	$Final1/Panel/Info.text = spell.info[final1]
	$Final2/Panel/Info.text = spell.info[final2]
	$Final3/Panel/Info.text = spell.info[final3]
	

func final_Spell(name):
	var final = load("res://Spells/Final/" + name + ".tscn")
	final = final.instantiate()
	player.add_child(final)
	player.remove_child(spell)
	PlayerManager.get_Arena().spells.erase(spell.name)
	get_tree().paused = false
	queue_free()

func _on_final_1_pressed():
	final_Spell(final1)


func _on_final_2_pressed():
	final_Spell(final2)


func _on_final_3_pressed():
	final_Spell(final3)
