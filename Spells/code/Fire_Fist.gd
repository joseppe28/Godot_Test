extends Area2D

var damage = 10
var level = 1
var attacking = false
@export var max_level = 10
@export var spell_name = "Fire Fist"

var info = {
	"0": "Create a Fist of Fire to defeat your enemies",
	"odd": "size +5%",
	"even": "damage +20%",
	"final": "master this spell"
}

func _physics_process(delta):
	if $Timer.is_stopped() and not attacking:
		var angle = randf_range(0, 2 * PI)
		attack()
		await $AnimatedSprite2D.animation_finished
		self.rotation = angle
		$Timer.start()
		$PointLight2D.visible = false
		attacking = false

func upgrade():
	level += 1
	if level % 2 == 0:
		damage += damage * 0.2
	else:
		scale += Vector2(scale.x*0.05,scale.y*0.05)


func attack():
	attacking = true
	$AnimatedSprite2D.play("action")
	$PointLight2D.visible = true
	for body in self.get_overlapping_bodies():
		if body.is_in_group("Enemy"):
			EnemyManager.damage(body, damage)
