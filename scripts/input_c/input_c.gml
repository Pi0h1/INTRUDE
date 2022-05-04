function CPlayerInput() constructor
{
	static TestAll = function()
	{
		static base = new InputButton();
		base.TestAll();
		
		TestThrottle();
	}
	
	static TestThrottle = function()
	{
		var gamepad = gamepad_is_connected( 0 );
		if ( gamepad )
		{
			var fGamepadAxisH = gamepad_axis_value( 0, gp_axislh );
			var fGamepadAxisV = gamepad_axis_value( 0, gp_axislv );
		}
		
		if ( gamepad && abs( fGamepadAxisH ) > ThrottleDeadZone )
			ThrottleX = ( fGamepadAxisH );
		else
			ThrottleX = ( Right.GetHeld() - Left.GetHeld() );
		if ( gamepad && abs( fGamepadAxisV ) > ThrottleDeadZone )
			ThrottleY = fGamepadAxisV;
		else
			ThrottleY = ( Down.GetHeld() - Up.GetHeld() );
		
		ThrottleDirection = point_direction( 0, 0, ThrottleX, ThrottleY );
		if ( gamepad )
		{
			var snap_angle = ( round( ThrottleDirection / 45 ) * 45 );
			if ( ThrottleDirection > snap_angle - ( ThrottleSnapRange / 2 ) && ThrottleDirection < snap_angle + ( ThrottleSnapRange / 2 ) )
				ThrottleDirection = snap_angle;
		}
		ThrottleScale = min( 1, point_distance( 0, 0, ThrottleX, ThrottleY ) );
	}
	
	ThrottleDeadZone = 17.5 / 100;
	ThrottleSnapAngles = 360 / 8;
	ThrottleSnapRange = 30;
	ThrottleX = 0;
	ThrottleY = 0;
	ThrottleDirection = 0;
	ThrottleScale = 0;
	
	Right = new InputButton( ord( "D" ), -1, gp_padr );
	Up = new InputButton( ord( "W" ), -1, gp_padu );
	Left = new InputButton( ord( "A" ), -1, gp_padl );
	Down = new InputButton( ord( "S" ), -1, gp_padd );
	ButtonA = new InputButton( vk_control, -1, gp_face1 );
	ButtonB = new InputButton( -1, mb_right, gp_face2 );
	ButtonC = new InputButton( -1, mb_left, gp_face3 );
	ButtonD = new InputButton( vk_space, -1, gp_face4 );
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
		|| ( m_nKeyboard != -1 && gamepad_button_check_pressed( 0, m_nGamepad) )
		
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
