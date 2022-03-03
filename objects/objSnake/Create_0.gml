//if !instance_exists(objCursor){instance_create(x,y,objCursor)}

globalvar delta; delta = 1;

enum P_ANG
{
	E,
	N,
	W,
	S,
	length
}

fSpeed = 1.5;
fAcceleration = 0.75;
fDeceleration = 0.25;
fXsp = 0;
fYsp = 0;

bCanMove = true;

cControls = {};
cControls.MoveUp = ord( "W" );
cControls.MoveLeft = ord( "A" );
cControls.MoveDown = ord( "S" );
cControls.MoveRight = ord( "D" );
cControls.Button1 = ord( "Z" );
cControls.Button2 = ord( "X" );
cControls.Button3 = ord( "C");

fDirection = 0;
fCardinal = P_ANG.E;

cThrottle = {};
cThrottle.m_fDeadZone = 17.5 / 100;
cThrottle.m_fSnapRange = 30;
cThrottle.m_fAxisH = 0;
cThrottle.m_fAxisV = 0;
cThrottle.m_fDirection = 0;
cThrottle.m_fScale = 0;

InputButton = function() constructor
{
	Pressed = false;
	Held = false;
	Released = false;
}

cInput = {};

cInput.Right = new InputButton();
cInput.Up = new InputButton();
cInput.Left = new InputButton();
cInput.Down = new InputButton();

// Constructor for sprites
// > [ East, North, West, South ]
// or
// > [ Left, Right ]
// or
// > Sprite
PSprite = function( sprites ) constructor
{
	East = -1;
	North = -1;
	West = -1;
	South = -1;
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

cSprites = {};
cSprites.Idle = new PSprite( [ sprPlayerIdleRight, sprPlayerIdleUp, sprPlayerIdleLeft, sprPlayerIdleDown ] );
cSprites.Walk = new PSprite( [ sprPlayerWalkRight, sprPlayerWalkUp, sprPlayerWalkLeft, sprPlayerWalkDown ] );
//cSprites.Punch = new PSprite( [ sprPlayerPunchRight ] );

GetSprite = function( sprite )
{
	var get;
	
	
	if is_string( sprite )
	{
		get = cSprites[$ sprite];
	}
	else if is_struct( sprite )
		get = sprite;
	
	switch fCardinal
	{
		case 0:
			break;
	}
	
	
	return 0;
}