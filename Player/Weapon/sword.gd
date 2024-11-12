extends Node2D

@export var damage = 10

func _physics_process(delta):
	attack()

func attack():
	if Input.is_action_pressed("Special") and $Timer.is_stopped():
		var angle = get_angle_to(get_global_mouse_position())
		$Area2D.rotation = angle
		$Area2D/AnimatedSprite2D.play("attack")
		for e in $Area2D.get_overlapping_bodies():
			if e.is_in_group("Enemy"):
				e.damage(damage)
		await $Area2D/AnimatedSprite2D.animation_finished
		$Timer.start()
		$Area2D/AnimatedSprite2D.play("idle")
