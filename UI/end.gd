extends CanvasLayer


func _ready() -> void:
	$killCount.text = str(PlayerManager.killCount)
	var time = PlayerManager.time
	var msec = fmod(time, 1) * 100
	var seconds = fmod(time, 60)
	var minutes = fmod(time, 3600) / 60
	
	$Control/minutes.text = "%02d :" % minutes
	$Control/sec.text = "%02d :" % seconds
	$Control/Msec.text = " %03d" % msec


func _on_button_pressed() -> void:
	PlayerManager.reset()
	get_tree().change_scene_to_file("res://Menus/Start_Screen.tscn")
