if (mouse_check_button_pressed(mb_left))
{
	direction = point_direction(x, y, mouse_x, mouse_y);
	spd = hitSpd;
}

spd = max(spd - fric, 0);

var _extraX = lengthdir_x(spd, direction);

if (!place_meeting(x + _extraX, y, Solid))
{
	x += _extraX;
}
else
{
	while (!place_meeting(x + sign(_extraX), y, Solid))
	{
		x += sign(_extraX);
	}
	
	//Podemos conseguir una reacción más realista al choque de la que teníamos antes
	//Frenando la velocidad al chocar
	
	spd = 0;
}

//Después lo mismo con Y
var _extraY = lengthdir_y(spd, direction);

if (!place_meeting(x, y + _extraY, Solid))
{
	y += _extraY;
}
else
{
	while (!place_meeting(x, y + sign(_extraY), Solid))
	{
		y += sign(_extraY);
	}
	
	spd = 0;
}

//Moverte entre escenas siguiente
if (keyboard_check_pressed(ord("Q")))
{
	room_goto(rm_golpe1);
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_golpe3);
}