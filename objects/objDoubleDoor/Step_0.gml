if point_distance(x,y,objPlayer.x,objPlayer.y) < 64
{
	isOpen=true;	
}

if (isOpen and distanceTravelled < 32) {
	distanceTravelled+=1*delta;
	isTravelling=true
	if isRight{
	x-=1*delta
	} else {
	x+=1*delta;
	}
} else {
	isTravelling=false;
}
