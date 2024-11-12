extends Area2D

var damage

func _ready():
	$AnimatedSprite2D.play("action")

func _physics_process(delta):
	if $Timer.is_stopped():
		for body in self.get_overlapping_bodies():
			if body.is_in_group("Enemy"):
				EnemyManager.damage(body, damage)
		$Timer.start()




func _on_animated_sprite_2d_animation_finished():
	PlayerManager.deactivate(self)
