class Hogar {
	var property nivelDeMugre
	var property confortOfrecido
	method esBueno(){return confortOfrecido/2>=nivelDeMugre }
	method fueAtacado(plaga){nivelDeMugre+=plaga.nivelDeDanio()}
	
}

class Huerta{
	var property capacidadDeProduccion
	var nivel
	method configuraHuertas(kilos){
		nivel=kilos
		
	}
	method esBueno(){return capacidadDeProduccion>nivel}
	method fueAtacado(plaga){capacidadDeProduccion-=plaga.nivelDeDanio()*0.1 
		if(plaga.transmiteEnfermedades()){capacidadDeProduccion-=10}
		
	}
}

class Mascota{
	var property nivelDeSalud
	method esBueno(){return nivelDeSalud>250}
	method fueAtacado(plaga){if(plaga.transmiteEnfermedades()){nivelDeSalud-=plaga.nivelDeDanio()}}
	
}

class Barrios{
	var property elementos=#{}
	method agregarElemento(elem){elementos.add(elem)}
	
	method elementosBuenos(){return elementos.filter{elem=>elem.esBueno()}}
	method elementosMalos(){return elementos.filter{elem=>not elem.esBueno()}}
	method esCopado(){return  self.elementosMalos().size()<self.elementosBuenos().size()}
}

class Plaga{
	var property poblacion
	method transmitenEnfermedades(){return poblacion>=10}
	method atacar(elemento){
		poblacion=poblacion*1.1
		elemento.fueAtacado()
	}	
	
}

class PlagaCucarachas inherits Plaga{
	var property pesoPromedio=10
	
	
	override method transmitenEnfermedades(){return super() && pesoPromedio>=10}
		
	override method atacar(elemento){
		pesoPromedio+=2
		super(elemento)
	}
	method nivelDeDanio(){return poblacion/2}
}

class PlagaPulgas inherits Plaga{
		
	
	method nivelDeDanio(){return poblacion*2}
	
}

class PlagaMosquitos inherits Plaga{

	override method transmitenEnfermedades(){return super() && poblacion%3==0}
	
	method nivelDeDanio(){return poblacion}
	
}

class PlagaGarrapatas inherits PlagaPulgas{
	override method atacar(elementos){
		poblacion+=poblacion*0.2
		elemento.fueAtacado()
		}
		
}
