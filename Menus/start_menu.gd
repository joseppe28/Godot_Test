extends CanvasLayer

func _ready() -> void:
	var len = get_viewport().get_visible_rect().size.x
	$ItemList.fixed_column_width = (len/$ItemList.max_columns) - 10


func _physics_process(delta: float) -> void:
	if $ItemList.get_selected_items().size() == 0:
		$Button.disabled = true
	else:
		$Button.disabled = false

var spells = {
	"Fire Mage": "Fire_Fist",
	"Ice Mage": "ice_spikes",
	"Necromancer": "summon",
	"Witch": "posion_flask",
	"Magic Figther": "magic_sword",
	"Water Mage": "Whirlpool_spawner",
	"Wind Mage": "windblade",
	"Electric Mage": "Electric_Field",
	"Earth Mage": "Earthquake"
}

func _on_button_pressed() -> void:
	var spell = $ItemList.get_selected_items()
	
	if spell.size() == 0:
		pass
	else:
		spell = $ItemList.get_item_text(spell[0])
		spell = spells.get(spell)
		PlayerManager.weapon = load("res://Spells/" + spell + ".tscn")
		PlayerManager.weapon = PlayerManager.weapon.instantiate()
		get_tree().change_scene_to_file("res://Arena.tscn")
