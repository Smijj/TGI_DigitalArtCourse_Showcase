extends PanelContainer

@export var label:Label
var counter:int = 0

func _ready() -> void:
	SignalBus.Collected.connect(_OnCollected)
	label.text = str(counter)
	
func _OnCollected() -> void:
	counter += 1
	label.text = str(counter)
