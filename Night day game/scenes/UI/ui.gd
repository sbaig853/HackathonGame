extends CanvasLayer

var tween: Tween
@onready var temp :int = $MarginContainer/TextureProgressBar.value
var night: bool = false 

func _ready():
	$day.start()

signal newGame()
signal leave()


func _process(_delta):
	if night:
		$MarginContainer/TextureProgressBar.value = $night.time_left*2
		Globals.timeDay = $night.time_left*2
	else:
		$MarginContainer/TextureProgressBar.value = $day.time_left
		Globals.timeDay = $day.time_left
	
	Globals.night = night
	
	$MarginContainer2/TextureProgressBar.value = Globals.playerHealth
	if(Globals.playerHealth <= 0):
		$MarginContainer3.visible = true
		$ColorRect.visible = true
		$MarginContainer2.visible = false
		$MarginContainer.visible = false
	
	if $MarginContainer3/VBoxContainer/Button.button_pressed:
		newGame.emit()
	if $MarginContainer3/VBoxContainer/Button2.button_pressed:
		leave.emit()

func timer():
	pass
	
	


func _on_day_timeout():
	$night.start()
	night = true


func _on_night_timeout():
	$day.start()
	night = false
