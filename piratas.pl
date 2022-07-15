%puerto(Puerto,Pais)
puerto(colon,panama).
puerto(georgetown,islasCaiman).
puerto(nicholls,bahamas).
puerto(habana,cuba).
puerto(cartagena,colombia).

%ruta(Puerto,OtroPuerto,Distancia)
ruta(colon,georgetown,70).
ruta(habana,colon,40).
ruta(nicholls,habana,30).
ruta(cartagena,nicholls,500).
ruta(cartagena,georgetown,200).

%viaje(Puerto,OtroPuerto,Botin,Embarcacion)
viaje(colon,nicholls,3000,galeon(4)).
viaje(colon,georgetown,5000,carabela(500,30)).
viaje(colon,georgetown,10000,galera(brasil)).
viaje(cartagena,georgetown,1000,galera(argentina)).
viaje(nicholls,cartagena,2000,galeon(6)).

%barcoPirata(CapitanPirata,NombreBarco,CantPiratas,Impetu)
barcoPirata(jackSparrow, perlaNegra,40,100).
barcoPirata(davyJones, holandesErrante,100,200).
barcoPirata(hectorBarbosa, venganzaDeLaReinaAna, 9, 0).

%Punto 1
puedeAbordar(Capitan,Embarcacion):-
		poderio(Capitan,Poderio),
		resistencia(Embarcacion,Resistencia),
		Poderio > Resistencia.

poderio(Capitan,Poderio):-
	barcoPirata(Capitan,_,CantPiratas,Impetu),
	Poderio is (CantPiratas + 2) * Impetu.

hayRuta(Puerto1,Puerto2,Distancia):-
	ruta(Puerto1,Puerto2,Distancia).

hayRuta(Puerto1,Puerto2,Distancia):-
	ruta(Puerto2,Puerto1,Distancia).

resistenciaEmbarcacion(Embarcacion,Resistencia) :-
    viaje(Puerto1,Puerto2,Mercancia,Embarcacion), 
    ruta(Puerto1,Puerto2,Distancia), 
    resistencia(Embarcacion,Distancia,Mercancia,Resistencia).
    
resistencia(galeon(Caniones),Distancia,_,Resistencia) :-
    Resistencia is Caniones*100/Distancia.

resistencia(carabela(_,Soldados),_,Mercancia,Resistencia) :-
    Resistencia is Mercancia/10 + Soldados.
    
resistencia(galera(espania),Distancia,_,Resistencia) :-
    Resistencia is 100/Distancia.
    
resistencia(galera(Pais),_,Mercancia,Resistencia) :-
    Pais\=espania,
    Resistencia is Mercancia*10.


%Punto 2

botinTotal(Capitan,Puerto,BotinTotal):-
	puerto(Puerto,_),
	barcoPirata(Capitan,_,_,_),
	findall(Botin, botinGanado(Capitan,Puerto,Botin) ,Botines),
	sumlist(Botines,BotinTotal).

botinGanado(Capitan,Puerto,Botin):-
	parteOSaleDe(Embarcacion,Puerto,Botin),
	puedeAbordar(Capitan,Embarcacion).	

parteOSaleDe(Embarcacion,Puerto,Botin):-
	viaje(Puerto,_,Botin,Embarcacion).

parteOSaleDe(Embarcacion,Puerto,Botin):-
	viaje(_,Puerto,Botin,Embarcacion).

%Punto 3
caracterizacion(Capitan, excentrico):-
    barcoPirata(Capitan, perlaNegra,_,_).
% Caracterización muy básica: cualquiera que sea el capitán del perla, resulta excéntrico.

caracterizacion(Capitan,decadente):-
	barcoPirata(Capitan,_,CantPiratas,_),
	CantPiratas < 10,
	not(puedeAbordar(Capitan,_)).

caracterizacion(Capitan, terrorDelPuerto):-
	puedeAbordarATodosEn(Capitan,Puerto),
	not(masDeUnoPuedeAbordarATodosEn(Puerto)).
% También puede hacerse con not(hayOtroQuePuedeAbordarATodosAdemasDe(Puerto,CapitanPirata)

masDeUnoPuedeAbordarATodosEn(Puerto):-	
    puedeAbordarATodosEn(Capitan,Puerto),
    puedeAbordarATodosEn(OtroCapitan,Puerto),
    Capitan \= OtroCapitan.	
    
puedeAbordarATodosEn(Capitan,Puerto):-
    barcoPirata(Capitan,_,_,_),
    puerto(Puerto,_),
    forall(parteOSaleDe(Embarcacion,Puerto,_),puedeAbordar(Capitan,Embarcacion)).

% Para averiguar caracterizaciones posibles de otro capitán
% Caracterización(willTurner,C).
% C = ...

%Punto 4

puedeIrDesdeHasta(Capitan, Puerto1, Puerto2):-
	puedeRealizarRuta(Capitan,Puerto1,Puerto2).

puedeIrDesdeHasta(Capitan, Puerto1, Puerto2):-
	puedeRealizarRuta(Capitan,Puerto1,OtroPuerto),
	puedeIrDesdeHasta(Capitan, OtroPuerto, Puerto2).

puedeRealizarRuta(Capitan,Puerto1,Puerto2):-
	ruta(Puerto1,Puerto2,Distancia),
	poderio(Capitan,Poderio),
	Poderio > Distancia.
