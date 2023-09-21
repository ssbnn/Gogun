extends Node2D

const TILE_preload := preload("res://tile.tscn")
const TILE_SPEED := 1000 
const TILE_INTERVAL = 0.24
const TILE_WIDTH = 240
const INITIAL_POS = Vector2(1300,650)

var tile_timer = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	tile_timer = TILE_INTERVAL
	# connect("empty_signal", self, "spawn_tile") 지금 문제가 tile이 생성되는 놈이라서 못받아들이는건가? 그래서 tile_detector를 만들었고
	# 그 안에서 signal을 emit해야할것 같은데 어떻게 해야할지 모르겠음
	# 일단 tile detector가 타일을 인식하기는 했음. 이제 그 시그널을 main에 잘 연결해서 해보자
	print("hello world")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	tile_timer -= delta
	if tile_timer <= 0:
		spawn_tile()
		tile_timer = TILE_INTERVAL
	# 타일 속도 및 타일 삭제 코드 
	for tile in get_children():
		if tile is StaticBody2D:
			tile.position.x -= TILE_SPEED * delta
		if tile.position.x < -200:
			tile.queue_free()
	

func create_obj(position):
	# 뒤따라서 타일을 만드는 방식은 타일생성위치에 동일 사이즈의 추가 콜리전을 만들어놓고, 해당 콜리전에 충돌반응이 존재하지 않을 때에만 타일 생성한다.
	pass


func spawn_tile():
	var tile = TILE_preload.instantiate()
	tile.position = Vector2(1300,650)

	add_child(tile) 

func test():
	print("this is test")
