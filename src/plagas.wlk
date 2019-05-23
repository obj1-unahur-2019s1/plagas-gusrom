class Hogar {
	var property nivelDeMugre
	var property confortOfrecido
	method esBueno(){return confortOfrecido/2>=nivelDeMugre }
	
}

class Huerta{
	var property capacidadDeProduccion
	var nivel
	method configuraHuertas(kilos){
		nivel=kilos
		
	}
	method esBueno(){return capacidadDeProduccion>nivel}
}

class Mascota{
	var property nivelDeSalud
	method esBueno(){return nivelDeSalud>250}
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
	
}

class PlagaCucarachas inherits Plaga{
	var property pesoPromedio=10
	
	
	override method transmitenEnfermedades(){return super() && pesoPromedio>=10}
		
	method atacar(elemento){poblacion=poblacion*1.1
		pesoPromedio+=2
	}
	method nivelDeDanio(){return poblacion/2}
}

class PlagaPulgas inherits Plaga{
	
	
	method atacar(elemento){poblacion=poblacion*1.1}	
	
	method nivelDeDanio(){return poblacion*2}
	
}

class PlagaMosquitos inherits Plaga{

	override method transmitenEnfermedades(){return super() && poblacion%3==0}
	
	method nivelDeDanio(){return poblacion}
}

