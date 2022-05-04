var inst = nCameraTarget;
if instance_exists( inst )
{
	var camera = view_camera[0];
	
	var camx = median( 0, inst.x - camera_get_view_width( camera ) / 2, room_width - camera_get_view_width( camera ) );
	var camy = median( 0, inst.y - camera_get_view_height( camera ) / 2, room_height - camera_get_view_height( camera ) );
	
	camera_set_view_pos( camera, camx, camy );
}