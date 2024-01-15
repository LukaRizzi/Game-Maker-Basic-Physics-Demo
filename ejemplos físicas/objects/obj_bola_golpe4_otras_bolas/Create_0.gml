spd = 0;

hitSpd = 5;

//Al rebotar, cuánto porcentaje de la velocidad se va a mantener? 1 sería todo, .5 sería la mitad.
wallBounciness = .8;

//Vamos a añadir choques con otras pelotas, así que vamos a tener dos valores
//1 Cuánta velocidad vamos a perder al chocar
ballBounciness = .8;
//2 Cuánta velocidad le vamos a añadir a la pelota con la que chocamos
ballTransferSpeed = .8;
/*
	Si vas a tener muchas pelotas rebotando juntas, no vas a querer que la suma de
	ballBounciness y de TransferSpeed sea mayor a 0 o capaz las pelotas se quedan rebotando por siempre.
	Pero valores más altos quedan más arcadey.
	También se puede emular con más cosas
*/

fric = .1;

//ESTA BOLA TIENE UNA VARIABLE DE INSTANCIA LLAMADA PLAYER_CONTROLLED