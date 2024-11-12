extends Area2D

@export var damage = 5
@export var spell_name = "Electric Field"
var level = 1
var max_level = 10

var info = {
	"0": "Create an Electric Field around you, protecting you from enemies",
	"odd": "size +10%",
	"even": "damage +10%",
	"final": "master this spell"
}

func _physics_process(delta):
	if $Timer.is_stopped():
		for body in self.get_overlapping_bodies():
			if body.is_in_group("Enemy"):
				EnemyManager.damage(body, damage)
		$Timer.start()

func upgrade():
	level += 1
	if level % 2 == 0:
		damage += damage * 0.1
	else:
		scale.x += scale.x * 0.1
		scale.y += scale.x * 0.1
		position = Vector2(0,0)
		
		
