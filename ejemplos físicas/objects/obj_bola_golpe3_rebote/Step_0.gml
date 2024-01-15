//Ok, vamos con el rebote, va a ser un poquito más complejo en lógica

if (mouse_check_button_pressed(mb_left))
{
	direction = point_direction(x, y, mouse_x, mouse_y);
	spd = hitSpd;
}

spd = max(spd - fric, 0);

var _extraX = lengthdir_x(spd, direction);
var _extraY = lengthdir_y(spd, direction);

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
	
	/*
		Arriba usamos lengthdir_x y lengthdir_y para convertir UN número (El ángulo direction)
		en DOS (Una X y una Y). Ahora queremos hacer lo contrario, invertir solo la X al chocar
		horizontalmente y conseguir un ángulo nuevo que tiene la X invertida.
		Para eso, usamos point_direction, y le invertimos el valor X del ángulo que conseguimos
		arriba con lengthdir_x.
		
		Espero que se haya entendido D:
	*/
	
	_extraX *= -1; //Ésto era el lengthdir_x, lo invertimos
	direction = point_direction(x, y , x + _extraX, y + _extraY);
	
	//Al chocar con una pared, la pelota pierde un porcentaje de velocidad
	spd *= wallBounciness;
}

//Lo mismo en Y

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
	
	_extraY *= -1;
	direction = point_direction(x, y , x + _extraX, y + _extraY);
	
	spd *= wallBounciness;
}

//Moverte entre escenas siguiente
if (keyboard_check_pressed(ord("Q")))
{
	room_goto(rm_golpe2);
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_golpe4);
}