var Inst = instance_nearest( x, y, objCharacter )

if ( Inst )
{
	if ( Inst.y <= y + 32 ) && ( Inst.y >= y - 32  )
	{
		bOpen = true;
	}
	else if ( bAutoClose )
	{
		bOpen = false;
	}
}

if ( bFlipped )
{
	if ( bOpen )
	{
		x = min( x + fOpenSpeed * delta, xstart + fOpenDistance );
	}
	else
	{
		x = max( xstart, x - fCloseSpeed * delta );
	}
}
else
{
	if ( bOpen )
	{
		x = max( x - fOpenSpeed * delta, xstart - fOpenDistance );
	}
	else
	{
		x = min( xstart, x + fCloseSpeed * delta );
	}
}

