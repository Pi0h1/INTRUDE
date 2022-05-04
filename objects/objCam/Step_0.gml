
var Target = objPlayer;

if !instance_exists( Target )
{
	return;
}

var fDestX = 0;
var fDestY = 0;

if ( bAreaCamera )
{
	var iAreaW = camera_get_view_width( view_camera );
	var iAreaH = camera_get_view_height( view_camera );
	fDestX = max( 0, floor( Target.x / iAreaW ) * iAreaW );
	fDestY = max( 0, floor( Target.y / iAreaH ) * iAreaH );
}

if ( bSnapToArea )
{
	bSnapToArea = false;
	x = fDestX;
	y = fDestY;
}

var fDis = point_distance( x, y, fDestX, fDestY );
var fDir = point_direction( x, y, fDestX, fDestY );
var fSpd = ( fDis * 0.1 * delta );

x += dcos( fDir ) * fSpd;
y -= dsin( fDir ) * fSpd;



camera_set_view_pos( view_camera, x, y );