extends Area2D

var level = 1
var target
var enemy = "res://Spells/Summons/summon_runner.tscn"
var spell_name = "Summon"
var max_level = 8
var damage = 10

var info = {
	"0": "Summon enemies to help you",
	"even": "damage +10%",
	"odd": "wait time -5%",
	"final": "master this spell",
}

func _on_timer_timeout() -> void:
	if len(get_overlapping_bodies()) > 0:
		target = get_overlapping_bodies().pick_random()
		while(not is_instance_valid(target) or not target.is_in_group("Enemy")):
			target = get_overlapping_bodies().pick_random()
		var summon = load(enemy)
		summon = summon.instantiate()
		summon.target = target
		summon.global_position = global_position
		summon.health = damage
		get_tree().current_scene.add_child(summon)
	$Timer.start()
	
func upgrade():
	level += 1
	if level == max_level:
		PlayerManager.final(self)
		return
	if level % 2 == 0:
		damage += damage * 0.1
	else:
		$Timer.wait_time -= $Timer.wait_time * 0.05
