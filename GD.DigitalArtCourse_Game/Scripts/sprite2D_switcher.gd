extends Sprite2D

@export var _sprites: Array[Texture2D]
@export var _switch_time:float = 1
var _switch_counter:float = 0 

var _texture_index: int = 0

func _ready() -> void:
	if _sprites.size() > 0:
		_SetTexture(_sprites[_texture_index])

func _process(delta: float) -> void:
	if _sprites.size() <= 0: return
	
	if _switch_counter < _switch_time:
		_switch_counter += delta
	else:
		_texture_index += 1
		if _texture_index >= _sprites.size():
			_texture_index = 0
		_SetTexture(_sprites[_texture_index])
		_switch_counter = 0

func _SetTexture(tex:Texture2D) -> void:
	if !tex: return
	texture = tex
