extends RigidBody2D

var level = 1
var size = 150
@export var max_level = 10
@export var spell_name = "Push"

var info = {
	"0": "Create a Force that pushes enemies away from you",
	"odd": "Cooldown -5%",
	"even": "size +10%",
	"final": "master this spell"
}

func _physics_process(delta):
	if $Timer.is_stopped():
		if $CollisionShape2D.shape.radius < size:
			$CollisionShape2D.shape.radius += size/30
		else:
			$CollisionShape2D.shape.radius = 0
			$Timer.start()

func upgrade():
	level += 1
	if level % 2 == 0:
		size += size * 0.1
	else:
		$Timer.wait_time -= $Timer.wait_time * 0.05
