extends CharacterBody2D

var shootPoint: Array 
var slectedPoint

var playerDirection
var direction

const speed: int = 200
var canShoot: bool = true

signal shoot(pos,direction)

func _process(delta):
	look_at(get_global_mouse_position())
	Globals.playerPos = position
	
	direction = Input.get_vector("left","right","up","dpwn")
	velocity = direction * speed
	move_and_slide()
	
	
	playerDirection = (get_global_mouse_position() - position).normalized()
	
	if(Input.is_action_just_pressed("shoot") and canShoot):
		canShoot = false
		$shootTimer.start()
		
		shootPoint = $shootingPoints.get_children()
		slectedPoint = shootPoint[randi() % shootPoint.size()]
		$AnimatedSprite2D.play("default",1.0,true)
		
		shoot.emit(slectedPoint.global_position, playerDirection)
	


func hit():
	print('hit player')
	var tween = get_tree().create_tween()
	tween.parallel()
#	tween.tween_property()

func _on_shoot_timer_timeout():
	canShoot = true


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.stop()
