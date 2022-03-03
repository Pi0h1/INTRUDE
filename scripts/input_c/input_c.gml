function CPlayerInput() constructor
{
	static TestAll = function()
	{
		static base = new InputButton();
		base.TestAll();
	}
	
	
	Right = new InputButton( ord( "D" ), -1, gp_padr );
	Up = new InputButton( ord( "W" ), -1, gp_padu );
	Left = new InputButton( ord( "A" ), -1, gp_padl );
	Down = new InputButton( ord( "S" ), -1, gp_padd );
	ButtonA = new InputButton( vk_control, -1, gp_face1 );
	ButtonB = new InputButton( -1, mb_right, gp_face2 );
	ButtonC = new InputButton( -1, mb_left, gp_face3 );
	ButtonD = new InputButton( ord( "E" ), -1, gp_face4 );
	QuickInvA = new InputButton( -1, -1, gp_shoulderl );
	QuickInvB = new InputButton( -1, -1, gp_shoulderr );
	InventoryA = new InputButton( ord( "Q" ) , -1, gp_shoulderlb );
	InventoryB = new InputButton( vk_tab , -1, gp_shoulderrb );
	
	Select = new InputButton( vk_backspace, -1, gp_select );
	Start = new InputButton( vk_enter, -1, gp_start );
}

function InputButton( button_kb = -1, button_mouse = -1, button_gp = -1 ) constructor
{
	static Inputs = [];
	
	static TestAll = function()
	{
		for ( var i = 0; i < InputsC; i++ )
		{
			Inputs[i].TestInput();
		}
	}
	
	static TestInput = function()
	{
		m_bPressed = ( m_nKeyboard != -1 && keyboard_check_pressed( m_nKeyboard ) )
		|| ( m_nMouse != -1 && mouse_check_button_pressed( m_nMouse ) )
		|| ( m_nKeyboard != -1 && gamepad_button_check( 0, m_nGamepad) )
		
		m_bHeld = ( m_nKeyboard != -1 && keyboard_check( m_nKeyboard ) )
		|| ( m_nMouse != -1 && mouse_check_button( m_nMouse ) )
		|| ( m_nKeyboard != -1 && gamepad_button_check( 0, m_nGamepad) )
		
		m_bReleased = ( m_nKeyboard != -1 && keyboard_check_released( m_nKeyboard ) )
		|| ( m_nMouse != -1 && mouse_check_button_released( m_nMouse ) )
		|| ( m_nKeyboard != -1 && gamepad_button_check_released( 0, m_nGamepad) )
	}
	
	static GetPressed = function()
	{
		return m_bPressed;
	}
	
	static GetHeld = function()
	{
		return m_bHeld;
	}
	
	static GetReleased = function()
	{
		return m_bReleased;
	}
	
	static InputsC = 0; Inputs[ InputsC++ ] = self;
	
	self.m_nKeyboard = button_kb;
	self.m_nMouse = button_mouse;
	self.m_nGamepad = button_gp;
	
	self.m_bPressed = false;
	self.m_bHeld = false;
	self.m_bReleased = false;
}

function InputPlayerThrottle()
{
	var gamepad = gamepad_is_connected( 0 );
	if ( bCanMove )
	{
		if ( gamepad )
		{
			var fGamepadAxisH = gamepad_axis_value( 0, gp_axislh );
			var fGamepadAxisV = gamepad_axis_value( 0, gp_axislv );
		}
	
		if ( gamepad && abs( fGamepadAxisH ) > cThrottle.m_fDeadZone )
			cThrottle.m_fAxisH = ( fGamepadAxisH ) ;
		else
			cThrottle.m_fAxisH = ( cPlayerInput.Right.GetHeld() - cPlayerInput.Left.GetHeld() );
		if ( gamepad && abs( fGamepadAxisV ) > cThrottle.m_fDeadZone )
			cThrottle.m_fAxisV = fGamepadAxisV;
		else
			cThrottle.m_fAxisV = ( cPlayerInput.Down.GetHeld() - cPlayerInput.Up.GetHeld() );
	
		cThrottle.m_fDirection = point_direction( 0, 0, cThrottle.m_fAxisH, cThrottle.m_fAxisV );
		if ( gamepad )
		{
			var snap_angle = ( round( cThrottle.m_fDirection / 45 ) * 45 );
			if ( cThrottle.m_fDirection > snap_angle - ( cThrottle.m_fSnapRange / 2 ) && cThrottle.m_fDirection < snap_angle + ( cThrottle.m_fSnapRange / 2 ) )
				cThrottle.m_fDirection = snap_angle;
		}
		cThrottle.m_fScale = min( 1, point_distance( 0, 0, cThrottle.m_fAxisH, cThrottle.m_fAxisV ) );
	}
	else
	{
		cThrottle.m_fAxisH = 0;
		cThrottle.m_fAxisV = 0;
		cThrottle.m_fScale = 0;
	}
}