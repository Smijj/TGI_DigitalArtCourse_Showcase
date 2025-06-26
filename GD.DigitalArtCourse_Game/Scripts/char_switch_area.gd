extends Area2D

@export var char_index : int = 0

func _ready() -> void:
	body_entered.connect(_OnBodyEntered)
	
func _OnBodyEntered(body:Node2D):
	print(body.name," entered area ",char_index)
	if not body is CharCtrl: return
	
	var char_ctrl = body as CharCtrl
	char_ctrl.SetCharacter(char_index)
