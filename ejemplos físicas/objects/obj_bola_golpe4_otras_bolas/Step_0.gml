if (mouse_check_button_pressed(mb_left) && player_controlled)
{
	direction = point_direction(x, y, mouse_x, mouse_y);
	spd = hitSpd;
}

spd = max(spd - fric, 0);

var _extraX = lengthdir_x(spd, direction);
var _extraY = lengthdir_y(spd, direction);

//Ahora checkeamos si la pelota choca con algo solido O con otra pelota
if (!place_meeting(x + _extraX, y, Solid) && !place_meeting(x + _extraX, y, obj_bola_golpe4_otras_bolas))
{
	x += _extraX;
}
else
{
	while (!place_meeting(x + sign(_extraX), y, Solid) && !place_meeting(x + sign(_extraX), y, obj_bola_golpe4_otras_bolas))
	{
		x += sign(_extraX);
	}
	
	//Acabamos de chocar con una pelota o con una pared, vamos a revisar con qué
	var _otraBola = instance_place(x + sign(_extraX), y, obj_bola_golpe4_otras_bolas);
	if (_otraBola == noone) //Si no chocamos con una pelota, osea chocamos con una pared
	{
		_extraX *= -1;
		direction = point_direction(x, y , x + _extraX, y + _extraY);
	
		spd *= wallBounciness;
	}
	else
	{
		//A la otra bola le vamos a pasar la dirección del rebote y la velocidad que queremos
		_otraBola.direction = point_direction(x, y, _otraBola.x, _otraBola.y);
		_otraBola.spd += spd * ballTransferSpeed;
		
		//Si, en cambio, chocamos con otra pelota, nuestra nueva dirección va a ser alejándonos de ella
		direction = point_direction(_otraBola.x, _otraBola.y, x, y);
		//Nueva velocidad
		spd *= ballBounciness;
	}
}

/*
	ESTO NO ES PERFECTO. El nuestro con 3D era más complejo no solo por el 3D y hay algunas cosas flasheras
	que no estoy explicando for the sake of complexity (Por ejemplo, al chocar las pelotas lo ideal es no cambiarle
	la dirección a la otra, porque así ambas registran el choque e intercambian fuerzas y no solo una; pero es
	más complicao y más esfuerzo, con ésto tenés un sistema básico sobre el que poder expandir que seguramente puedas
	entender fácil)
*/

//Lo mismo en Y

if (!place_meeting(x, y + _extraY, Solid) && !place_meeting(x, y + _extraY, obj_bola_golpe4_otras_bolas))
{
	y += _extraY;
}
else
{
	while (!place_meeting(x, y + sign(_extraY), Solid) && !place_meeting(x, y + sign(_extraY), obj_bola_golpe4_otras_bolas))
	{
		y += sign(_extraY);
	}
	
	var _otraBola = instance_place(x, y + sign(_extraY), obj_bola_golpe4_otras_bolas);
	if (_otraBola == noone)
	{
		_extraY *= -1;
		direction = point_direction(x, y , x + _extraX, y + _extraY);
	
		spd *= wallBounciness;
	}
	else
	{
		_otraBola.direction = point_direction(x, y, _otraBola.x, _otraBola.y);
		_otraBola.spd += spd * ballTransferSpeed;
		
		direction = point_direction(_otraBola.x, _otraBola.y, x, y);
		spd *= ballBounciness;
	}
}

//Moverte entre escenas siguiente
if (keyboard_check_pressed(ord("Q")))
{
	room_goto(rm_golpe3);
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_velocidadFija);
}