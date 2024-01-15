direction = point_direction(x, y, mouse_x, mouse_y); //que este objeto apunte en la direccion del mouse

if (mouse_check_button(mb_left))
{
	/*
	LENGHTDIR convierte un ángulo + una distancia en un valor de x o de y para avanzar.
	Por ejemplo, si quiero moverme 3 unidades en 45 grados
	(osea, la mitad hacia arriba, la mitad hacia la derecha), lengthdir_x me va a devolver 1.5 y
	lenghtdir_y -1.5, que entre los dos es un total de 3 unidades de movimiento en esa dirección.
	
	Con este código, la pelota sigue al mouse, sin colisiones, con una velocidad fija, al clickear
	*/
	
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
}

//Moverte entre escenas siguiente
if (keyboard_check_pressed(ord("Q")))
{
	room_goto(rm_golpe4); //El ultimo
}
if (keyboard_check_pressed(ord("E")))
{
	room_goto(rm_aceleracion);
}