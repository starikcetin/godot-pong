extends Node2D

signal Area2D_area_entered

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = 0;
	
	if Input.is_action_pressed("ui_up"):
		dir = -1
	elif Input.is_action_pressed("ui_down"):
		dir = 1
		
	translate(Vector2(0, dir * speed * delta));

func _on_Area2D_area_entered(area):
	emit_signal("Area2D_area_entered", area)
