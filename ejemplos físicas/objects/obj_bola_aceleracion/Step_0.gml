direction = point_direction(x, y, mouse_x, mouse_y); //que este objeto apunte en la direccion del mouse

if (mouse_check_button(mb_left))
{
	spd = min(spd + acc, maxSpd); //Al apretar click la velocidad acelera, pero nunca pasa de la máxima
}
else
{
	spd = max(spd - fric, 0); //Al no tener click apretado bajar la velocidad, nunca pasar a menos de 0
}

//En vez de movernos con un número de velocidad que siempre es el mismo, nos movemos con una variable
//velocidad que cambia según la aceleración, fricción y situación del objeto
	
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

//Moverte entre escenas siguiente
if (keyboard_check_pressed(ord("Q")))
{
	room_goto(rm_velocidadFija);
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_colisiones1);
}