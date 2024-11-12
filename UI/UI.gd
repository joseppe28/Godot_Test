extends CanvasLayer


func _physics_process(delta):
	var msec = get_tree().current_scene.msec
	var sec = get_tree().current_scene.seconds
	var minutes = get_tree().current_scene.minutes
	$Control/minutes.text = "%02d :" % minutes
	$Control/sec.text = "%02d :" % sec
	$Control/Msec.text = " %03d" % msec
	
	$Health.value = PlayerManager.health
	$Exp.max_value = PlayerManager.next_level
	$Exp.value = PlayerManager.exp
	
	$killCount/label.text = str(PlayerManager.killCount)
	
	$Enemies.text = str(EnemyManager.count)
	
