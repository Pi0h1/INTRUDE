//if !instance_exists(objCursor){instance_create(x,y,objCursor)}

globalvar delta; delta = 1;

enum CARDINAL
{
	E,
	NE,
	N,
	NW,
	W,
	SW,
	S,
	SE,
}

enum P_STATE
{
	DEFAULT,
}

fSpeed = 1;
fAcceleration = 0.75;
fDeceleration = 0.25;
fFriction = 1;
fXsp = 0;
fYsp = 0;

nState = 0;

bCanMove = true;
bForceStill = false;

fCardinal = 0;
fDirection = 0;
fSpeedDirection = 0;
fSpeedDistance = 0;


cControls = {};
cControls.MoveUp = ord( "W" );
cControls.MoveLeft = ord( "A" );
cControls.MoveDown = ord( "S" );
cControls.MoveRight = ord( "D" );
cControls.Button1 = ord( "Z" );
cControls.Button2 = ord( "X" );
cControls.Button3 = ord( "C");

cThrottle = {};
cThrottle.m_fDeadZone = 17.5 / 100;
cThrottle.m_fSnapRange = 25;
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
cSprites.WalkSlow = new PSprite( [ sprPlayerWalkRight, sprPlayerWalkUp, sprPlayerWalkLeft, sprPlayerWalkDown ] );
cSprites.Punch = new PSprite( [ sprPlayerPunchRight,sprPlayerPunchUp, sprPlayerPunchLeft, sprPlayerPunchDown ] );

GetSprite = function( sprite )
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
	return sprite_index;
}