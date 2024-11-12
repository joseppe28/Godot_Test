extends Area2D

@export var damage = 5
@export var spell_name = "Seism"
var attacking = false

func _physics_process(delta):
	if $Timer.is_stopped() and not attacking:
		attacking = true
		for body in self.get_overlapping_bodies():
			if body.is_in_group("Enemy"):
				EnemyManager.damage(body, damage)
		$Timer.start()
		attacking = false
