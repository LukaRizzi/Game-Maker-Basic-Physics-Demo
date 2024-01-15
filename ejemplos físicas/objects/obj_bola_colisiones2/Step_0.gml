direction = point_direction(x, y, mouse_x, mouse_y);

if (mouse_check_button(mb_left))
{
	spd = min(spd + acc, maxSpd);
}
else
{
	spd = max(spd - fric, 0);
}

var _extraX = lengthdir_x(spd, direction);

//Revisamos si podemos movernos a esa posición, y si podemos lo hacemos
if (!place_meeting(x + _extraX, y, Solid))
{
	x += _extraX;
}
else
{
	/*
		No sé si lo notaste en el ejemplo anterior, pero un problema con movernos así nomás es que a veces
		hay una colisión pero con una diferencia de pixeles. Osea, si tengo una pared hacia la derecha a 4
		pixeles y me quiero mover 5, va a detectar la colisión y no me voy a poder mover, pero me voy a quedar
		en el lugar a 4 píxeles de diferencia. Para solucionar ésto, vamos a decir que si hay una colisión
		en el lugar al que queremos ir, vamos a ir pixel por pixel moviéndonos hasta que ya no podamos más.
	*/
	while (!place_meeting(x + sign(_extraX), y, Solid))
	{
		/*
			Sign es una función que nos devuelve -1 si _extraX es negativo, 0 si es 0 y 1 si es positivo.
			Mientras no haya un objeto solido 1 solo píxel en la dirección que avanzamos, movernos 1 pixel
			hacia ahí.
		*/
		x += sign(_extraX);
		
		/*
			Dato, innecesario pero que suma:
			
			Nos estamos moviendo con velocidades que se aceleran por valores menores a enteros (osea, fracciones),
			y como en game maker 1 unidad = 1 pixel en pantalla, nos estamos moviendo a veces cantidades
			menores a 1 pixel. Para que nuestro sprite no aparezca medio pixel adentro de la pared,
			podemos redondear el x y la y a valores enteros. Yo no lo hago porque es re opcional, y se puede
			no hacer o hasta se puede hacer en el draw event dibujando el sprite en su posición roundeada.
			
			Es una decisión de gusto y de caso a caso según las físicas y la cámara del juego. Yo no lo hago
			porque es al pedo para lo que vamos a hacer en éste caso.
			
			Se podría hacer poniendo acá
			x = round(x);
			
			O poniendo en el draw event
			draw_sprite(sprite_index, image_index, round(x), round(y));
			
			O de otras formas, qcy.
		*/
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
	room_goto(rm_colisiones1);
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_golpe1);
}