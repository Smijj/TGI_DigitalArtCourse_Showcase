extends CharacterBody2D
class_name CharCtrl


@export var _speed = 300.0
@export var _jump_velocity = 400.0

#@export var _current_sprite: AnimatedSprite2D
@export var _char_sprites: Array[AnimatedSprite2D]
var _current_sprite:AnimatedSprite2D = null

func SetCharacter(index:int) -> void:
	if index >= 0 && index < _char_sprites.size(): 
		_current_sprite.hide()
		_current_sprite = _char_sprites[index]
		_current_sprite.show()
		print("Switched to index ", index)
		

func _GetSprite(index:int) -> AnimatedSprite2D:
	if index < 0 || index >= _char_sprites.size(): return null;
	return _char_sprites[index]

func _ready() -> void:
	if (not _char_sprites.is_empty()):
		_current_sprite = _char_sprites[0]
		_current_sprite.show()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -_jump_velocity
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * _speed
		
		# Handle Facing direction
		if _current_sprite:
			if direction > 0:
				if _current_sprite.sprite_frames.has_animation("Run"):
					_current_sprite.animation = "Run"
				_current_sprite.flip_h = false
			elif direction < 0:
				if _current_sprite.sprite_frames.has_animation("Run"):
					_current_sprite.animation = "Run"
				_current_sprite.flip_h = true
	else: 
		velocity.x = move_toward(velocity.x, 0, _speed)
		if _current_sprite && _current_sprite.sprite_frames.has_animation("Idle"):
			_current_sprite.animation = "Idle"

	move_and_slide()
