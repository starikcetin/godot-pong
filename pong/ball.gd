extends Node2D

export var speed = 50
var forward = Vector2(0.5, 0.5).normalized()

func _ready():
	randomize()
	randomizeForward()


func _process(delta):
	translate(forward * speed * delta);
	
	
func randomizeForward():
	var randomSign = round(rand_range(0,1))*2 - 1
	var randomAngle = rand_range(-45, 45)
	forward = Vector2(randomSign, 0).rotated(randomAngle)


func _on_top_area_entered(area):
	if self.is_a_parent_of(area):
		print_debug("_on_top_area_entered")
		forward.y *= -1


func _on_bottom_area_entered(area):
	if self.is_a_parent_of(area):
		print_debug("_on_bottom_area_entered")
		forward.y *= -1


func _on_left_area_entered(area):
	if self.is_a_parent_of(area):
		print_debug("game over (ball hits left edge)")
		restartGame()


func _on_right_area_entered(area):
	if self.is_a_parent_of(area):
		print_debug("game over (ball hits right edge)")
		restartGame()


func _on_racketLeft_Area2D_area_entered(area):
	if self.is_a_parent_of(area):
		print_debug("_on_racketLeft_Area2D_area_entered")
		forward.x *= -1


func _on_racketRight_Area2D_area_entered(area):
	if self.is_a_parent_of(area):
		print_debug("_on_racketRight_Area2D_area_entered")
		forward.x *= -1
		

func restartGame():
	position = Vector2.ZERO
	_ready()
