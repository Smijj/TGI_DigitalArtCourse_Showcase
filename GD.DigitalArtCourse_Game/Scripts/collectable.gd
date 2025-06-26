extends Area2D

func _ready() -> void:
	body_entered.connect(_OnBodyEntered)
	
func _OnBodyEntered(body:Node2D):
	if not body is CharCtrl: return
	
	SignalBus.Collected.emit()
	
	queue_free()
	
	
