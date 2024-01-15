direction = point_direction(x, y, mouse_x, mouse_y); //que este objeto apunte en la direccion del mouse

if (mouse_check_button(mb_left))
{
	spd = min(spd + acc, maxSpd); //Al apretar click la velocidad acelera, pero nunca pasa de la máxima
}
else
{
	spd = max(spd - fric, 0); //Al no tener click apretado bajar la velocidad, nunca pasar a menos de 0
}

//Solucionar las colisiones un eje a la vez hace mucho más fácil lidiar con ellas
//Primero hagamos la X ponele, dándole prioridad

var _extraX = lengthdir_x(spd, direction);

//Revisamos si podemos movernos a esa posición, y si podemos lo hacemos
if (!place_meeting(x + _extraX, y, Solid))
{
	x += _extraX;
}

//Después lo mismo con Y
var _extraY = lengthdir_y(spd, direction);

if (!place_meeting(x, y + _extraY, Solid))
{
	y += _extraY;
}

//Moverte entre escenas siguiente
if (keyboard_check_pressed(ord("Q")))
{
	room_goto(rm_aceleracion);
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_colisiones2);
}