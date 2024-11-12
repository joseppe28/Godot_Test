extends Node

var enemies = []
var target
var count = 0

func _physics_process(delta: float) -> void:
	for e in enemies:
		if e.stopped:
			e.move_and_slide()
			continue
		target = PlayerManager.get_Player().global_position
		var angle = e.get_angle_to(target)
		e.velocity.x = cos(angle) * e.speed
		e.velocity.y = sin(angle) * e.speed
		e.move_and_slide()
		e.time += delta
		if(e.time >= e.delete):
			e.death()
			var i = enemies.find(e)
			enemies.pop_at(i)
			


func damage(enemy, damage) -> void:
	var i = enemies.find(enemy)
	if i < 0:
		return
	enemies[i].health -= damage
	if enemies[i].health <= 0:
		PlayerManager.killCount += 1
		PlayerManager.exp += enemies[i].exp
		enemies[i].death()
		enemies.pop_at(i)
	
	
