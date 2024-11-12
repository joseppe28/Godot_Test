extends CanvasLayer

var spell1
var spell2 
var spell3
var scene = PlayerManager.get_Arena()

func _ready():
	spell1 = get_spell()
	spell2 = get_spell()
	while spell1.name == spell2.name:
		spell2 = get_spell()
	spell3 = get_spell()
	while spell1.name == spell3.name or spell2.name == spell3.name:
		spell3 = get_spell()
	
	$Spell1.text = spell1.spell_name
	$Spell2.text = spell2.spell_name
	$Spell3.text = spell3.spell_name
	
	$Spell1/Panel/Info.text = spell1.info[get_info(spell1)]
	$Spell1/Panel/Control/Icon.texture = load("res://Spells/icons/" + spell1.name + ".aseprite" )
	$Spell1/Panel/level.text = "LV: " + str(scene.spells[spell1.name])
	
	$Spell2/Panel/Info.text = spell2.info[get_info(spell2)]
	$Spell2/Panel/Control/Icon.texture = load("res://Spells/icons/" + spell2.name + ".aseprite" )
	$Spell2/Panel/level.text = "LV: " + str(scene.spells[spell2.name])
	
	$Spell3/Panel/Info.text = spell3.info[get_info(spell3)]
	$Spell3/Panel/Control/Icon.texture = load("res://Spells/icons/" + spell3.name + ".aseprite" )
	$Spell3/Panel/level.text = "LV: " + str(scene.spells[spell3.name])


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Spell1"):
		_on_spell_1_pressed()
	if Input.is_action_just_pressed("Spell2"):
		_on_spell_2_pressed()
	if Input.is_action_just_pressed("Spell3"):
		_on_spell_3_pressed()

func _on_spell_1_pressed():
	get_tree().paused = false
	PlayerManager.level_up(spell1)
	scene.spells[spell1.name] += 1
	queue_free()


func _on_spell_2_pressed():
	get_tree().paused = false
	PlayerManager.level_up(spell2)
	scene.spells[spell2.name] += 1
	queue_free()


func _on_spell_3_pressed():
	get_tree().paused = false
	PlayerManager.level_up(spell3)
	scene.spells[spell3.name] += 1
	queue_free()

func get_spell():
	var spells = scene.spells
	var spell_name = spells.keys()
	var rnd = randi_range(0, len(spells)-1)
	var spell = spell_name[rnd]
	spell = load("res://Spells/" + spell + ".tscn")
	spell = spell.instantiate()
	return spell

func get_info(spell):
	var level = scene.spells[spell.name]
	if level == 0:
		return "0"
	elif level == spell.max_level-1:
		return "final"
	elif (level + 1) % 2 == 0:
		return "even"
	else:
		return "odd"
