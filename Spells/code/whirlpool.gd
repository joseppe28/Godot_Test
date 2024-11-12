extends Area2D

var level = 1
var max_level = 10
var damage = 5
var len
var height
var strength = 300
var size 

var info = {
	"0": "Throw a poisonous potion at your enemies",
	"even": "Cooldown -5%",
	"odd": "damage +20%",
	"final": "master this spell"
}

func _ready():
	$damage/CollisionShape2D.shape.radius = size 


func _physics_process(delta):
	for e in self.get_overlapping_bodies():
		if not e.is_in_group("Enemy"):
			continue
		var angle = e.get_angle_to(self.global_position)
		var x = cos(angle) * strength
		var y = sin(angle) * strength
		e.stopped = true
		e.velocity = Vector2(x,y)
	if $Timer.is_stopped():
		for e in $damage.get_overlapping_bodies():
			if e.is_in_group("Enemy"):
				EnemyManager.damage(e, damage)
		$Timer.start()


func _on_body_exited(body):
	if body.is_in_group("Enemy"):
		body.stopped = false


func _on_delete_timeout():
	PlayerManager.deactivate(self)
