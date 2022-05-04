function scrHUD(){
	
var uiGun_x=(256*2)-(72);
var uiGun_y=(192*2)-(48);

/*
display_set_gui_maximise( 1, 1 );
var text = object_get_name( object_index )
var array = variable_instance_get_names( id );
array_sort( array, true )

for ( var i = 0; i < array_length( array ); i++ )
{
	text += "\n" + array[i] + ": " + string( variable_instance_get( id, array[i] ) );
}

var text_x = 5;
var text_y = 5;

draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_set_font( -1 );

for ( var i = 0; i < 360; )
{
	draw_set_color( c_black );
	draw_text( text_x + dcos( i ), text_y - dsin( i ), text );
	i += 90;
}

draw_set_color( c_lime );
draw_text( text_x, text_y, text );
*/

display_set_gui_size(256*2,192*2)
draw_sprite(sprItem,0,uiGun_x,uiGun_y)
}