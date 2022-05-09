if !instance_exists( Target )
{
	return;
}

var fDestX = 0;
var fDestY = 0;

var iAreaW = camera_get_view_width( view_camera );
var iAreaH = camera_get_view_height( view_camera );
fDestX = max( 0, floor( Target.x / iAreaW ) * iAreaW );
fDestY = max( 0, floor( Target.y / iAreaH ) * iAreaH );

var fDis = point_distance( x, y, fDestX, fDestY );
var fDir = point_direction( x, y, fDestX, fDestY );
var fSpd = ( fDis * 0.175 * delta );

x += dcos( fDir ) * fSpd;
y -= dsin( fDir ) * fSpd;


camera_set_view_pos( view_camera, x, y );

