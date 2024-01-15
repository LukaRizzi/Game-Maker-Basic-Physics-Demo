if (mouse_check_button_pressed(mb_left)) //Al hacer click, no al mantener click
{
	direction = point_direction(x, y, mouse_x, mouse_y); //Setear la dirección
	spd = hitSpd; //Settear la velocidad a la máxima posible
}

/*
	Ahora la pelota va a recibir fricción siempre, antes la sacábamos mientras acelerábamos para
	tener más constancia con la velocidad de aceleración en el balance.
*/

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
}

//Moverte entre escenas siguiente
if (keyboard_check_pressed(ord("Q")))
{
	room_goto(rm_colisiones2);
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_golpe2);
}