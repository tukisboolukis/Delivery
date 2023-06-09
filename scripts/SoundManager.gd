extends Node

var music_db = 0
var sound_db = 0

var arrows = []
var goblin_attack = []
var chicken_eat: AudioStreamPlayer
var chicken_death: AudioStreamPlayer
var congrats = []
var gate: AudioStreamPlayer
var goblin_death = []
var goblin_hurt: AudioStreamPlayer
var goblin_taunt = []
var goblin_laugh = []
var oxen_hurt: AudioStreamPlayer
var oxen_snort = []
var wagon_collision: AudioStreamPlayer
var wagon_move: AudioStreamPlayer
var wagon_creak: AudioStreamPlayer
var wood_impact: AudioStreamPlayer
var gold: AudioStreamPlayer

var menu_music: AudioStreamPlayer
var trail_music: AudioStreamPlayer


func _ready():
	music_db = AudioServer.get_bus_index("Music")
	sound_db = AudioServer.get_bus_index("Sound")
	
	arrows.append(load_sound("res://assets/sounds/arrow_release.wav"))
	arrows.append(load_sound("res://assets/sounds/arrow_release2.wav"))
	
	goblin_attack.append(load_sound("res://assets/sounds/attack1.wav"))
	goblin_attack.append(load_sound("res://assets/sounds/hiyah.wav"))
	
	chicken_eat = load_sound("res://assets/sounds/chicken_cluck.wav")
	chicken_death = load_sound("res://assets/sounds/chicken_bawk.wav")
	
	congrats.append(load_sound("res://assets/sounds/congrats1.wav"))
	congrats.append(load_sound("res://assets/sounds/congrats2.wav"))
	
	gate = load_sound("res://assets/sounds/gate_creak.wav")
	
	goblin_death.append(load_sound("res://assets/sounds/goblin_death1.wav"))
	goblin_death.append(load_sound("res://assets/sounds/goblin_death2.wav"))
	
	goblin_hurt = load_sound("res://assets/sounds/goblin_hurt1.wav")
	
	goblin_taunt.append(load_sound("res://assets/sounds/goblin_babble.wav"))
	goblin_taunt.append(load_sound("res://assets/sounds/hiyah.wav"))
	
	goblin_laugh.append(load_sound("res://assets/sounds/goblin_laugh1.wav"))
	goblin_laugh.append(load_sound("res://assets/sounds/goblin_laugh2.wav"))
	
	oxen_hurt = load_sound("res://assets/sounds/oxen_hurt1.wav")
	
	oxen_snort.append(load_sound("res://assets/sounds/ox_snort2.wav"))
	oxen_snort.append(load_sound("res://assets/sounds/ox_snort3.wave.wav"))
	oxen_snort.append(load_sound("res://assets/sounds/ox_snort.wav"))
	
	wagon_collision = load_sound("res://assets/sounds/wagon_collision.wav")
	
	wagon_move = load_sound("res://assets/sounds/wagon_movement.wav")
	
	wagon_creak = load_sound("res://assets/sounds/wooden_creak1.wav")
	
	wood_impact = load_sound("res://assets/sounds/wooden_impact1.wav")
	
	gold = load_sound("res://assets/sounds/Pickup_Coin5.wav")
	
	menu_music = load_sound("res://assets/sounds/menusong.wav", true)
	trail_music = load_sound("res://assets/sounds/Song1.wav", true)
	
	#menu_music.play()
	#trail_music.play()
	#menu_music.stream_paused = true
	#trail_music.stream_paused = true
	
	wagon_move.play()
	stop_wagon_move()
	
	
func load_sound(loc, music = false):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(loc)
	
	if not music:
		sound.bus = "Sound"
	else:
		sound.bus = "Music"
	add_child(sound)
	return sound
	

func get_random_sound(array):
	return array[randi() % array.size()]	
	

func play_arrow():
	get_random_sound(arrows).play()


func play_goblin_attack():
	get_random_sound(goblin_attack).play()
	

func play_chicken_eat():
	chicken_eat.play()
	

func play_chicken_death():
	chicken_death.play()


func play_congrats(i):
	congrats[i].play()
	

func play_gate():
	gate.play()
	

func play_goblin_death():
	get_random_sound(goblin_death).play()


func play_goblin_hurt():
	goblin_hurt.play()
	

func play_goblin_laugh():
	var rng = randi() % 2
	if rng == 0:
		get_random_sound(goblin_laugh).play()
	else:
		get_random_sound(goblin_taunt).play()
	

func play_oxen_hurt():
	oxen_hurt.play()
	

func play_oxen_snort():
	get_random_sound(oxen_snort).play()
	

func play_wagon_collision():
	wagon_collision.play()


func loop_wagon_move():
	wagon_move.stream_paused = false
	

func stop_wagon_move():
	wagon_move.stream_paused = true
	

func play_wagon_creak():
	wagon_creak.play()
	

func play_wood_impact():
	wood_impact.play()


func play_coin_sound():
	gold.play()
	

func play_menu_music():
	if not menu_music.playing:
		if trail_music.playing:
			trail_music.stop()
		menu_music.play()


func play_trail_music():
	if not trail_music.playing:
		if menu_music.playing:
			menu_music.stop()
		trail_music.play()

func stop_music():
	trail_music.stream_paused = true
	menu_music.stream_paused = true
	

func restart_music():
	if trail_music != null:
		trail_music.stream_paused = false
	if menu_music != null:
		menu_music.stream_paused = false
