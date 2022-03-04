

// Constructor for directional sprites
// > [ E, NE, N, NW, W, SW, S, SE ]
// or
// > [ East, North, West, South ]
// or
// > [ Left, Right ]
// or
// > Sprite
function CardinalSprite( sprites ) constructor
{
	East = -1;
	NorthEast = -1;
	North = -1;
	NorthWest = -1;
	West = -1;
	SouthWest = -1;
	South = -1;
	SouthEast = -1;
	
	if is_array( sprites )
	{
		switch array_length( sprites )
		{
			case 2:
				East = sprites[0];
				North = -1;
				West = sprites[1];
				South = -1;
				break;
			
			case 4:
				East = sprites[0];
				North = sprites[1];
				West = sprites[2];
				South	= sprites[3];
				break;
		}
	}
	else
	{
		East = sprites;
		North = sprites;
		West = sprites;
		South = sprites;
	}
}

// Return for cardinal sprite
// > "Name"
// or
// > struct
function GetCardinalSprite( sprite )
{
	try
	{
		var get;
	
		if is_string( sprite )
		{
			get = cSprites[$ sprite];
		}
		else if is_struct( sprite )
			get = sprite;
	
		if is_struct( get )
		{
			switch fCardinal
			{
				case CARDINAL.E:
				case CARDINAL.NE:
				case CARDINAL.SE:
					return get.East;
			
				case CARDINAL.W:
				case CARDINAL.NW:
				case CARDINAL.SW:
					return get.West;
			
				case CARDINAL.N:
					return get.North;
			
				case CARDINAL.S:
					return get.South;
			}
		}
	}
	catch(e) {};
	
	return sprite_index;
}