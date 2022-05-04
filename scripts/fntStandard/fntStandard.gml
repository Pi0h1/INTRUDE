function fntStandard(x,y,text,font,color){
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font);

for ( var i = 0; i < 360; )
{
	draw_set_color( c_black );
	draw_text( x + dcos( i ),  y - dsin( i ), text );
	i += 90;
}

draw_set_color( color );
draw_text( x, y, text );

draw_set_halign(fa_left);
draw_set_valign(fa_top);
}