if move=0 exit
depth=-y

up=keyboard_check(ord("W"))
down=keyboard_check(ord("S"))
right=keyboard_check(ord("D"))
left=keyboard_check(ord("A"))

r_up=keyboard_check_released(ord("W"))
r_down=keyboard_check_released(ord("S"))
r_right=keyboard_check_released(ord("D"))
r_left=keyboard_check_released(ord("A"))

if up {if place_free(x,y-spd){sprite_index=PlayerWalkUp y-=spd}}
if down {if place_free(x,y+spd){sprite_index=PlayerWalkDown y+=spd}}
if right {if place_free(x+spd,y){sprite_index=PlayerWalkRight x+=spd}}
if left {if place_free(x-spd,y){sprite_index=PlayerWalkLeft x-=spd}}

if r_up {sprite_index=PlayerIdleUp}
if r_down {sprite_index=PlayerIdleDown}
if r_right {sprite_index=PlayerIdleRight}
if r_left {sprite_index=PlayerIdleLeft}

x=round(x)
y=round(y)

