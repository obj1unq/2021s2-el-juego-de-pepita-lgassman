import extras.*
import wollok.game.*
import comidas.*

object izquierda{
	method siguiente(posicion) {
		return posicion.left(1)
	}
	
	method sufijo() {
		return "izq"
	}
}

object derecha {
	method siguiente(posicion) {
		return posicion.right(1)
	}
	
	method sufijo() {
		return "der"
	}
		
}

object arriba {
	method siguiente(posicion) {
		return posicion.up(1)
	}
	
	method sufijo() {
		return "izq" //todo pensar mejor que devolver
	}		
}

object abajo {
	method siguiente(posicion) {
		return posicion.down(1)
	}
	method sufijo() {
		return "izq" //todo pensar mejor que devolver
	}		
		
}

object cartel {
	const property position = game.at(5,5)
	const property text = "presione ENTER para salir"
	method textColor() { 
		return "ff0000ff"
	}
}

object pepita {

	var property energia = 100
	var property position = game.origin()
	var direccion = izquierda
	var enJuego = true

	method image() {
		return 	"pepita-" + self.sufijo() + ".png" 
	}
	
	method sufijo() {
		return (if (self.perdio()) "gris" 
				else if (self.estaEnElNido()) "grande" 
				else direccion.sufijo())
	}
	
	method ganar() {
		self.terminar("GANE!")
	}
	
	method perder() {
		self.terminar("PERDI!")
	}
	
	method terminar(mensaje) {
		game.say(self, mensaje)
		game.addVisual(cartel)
		game.removeTickEvent("GRAVEDAD")
		game.removeTickEvent("ALIMENTOS")
		keyboard.enter().onPressDo({game.stop()})
		enJuego = false
		//game.schedule(2000, {game.stop()})		
	}
	
	
	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}
	
	method validarEnJuego() {
		if(!enJuego) {
			self.error("Ya terminé")
		}
	}
	
	method mover(_direccion) {
		self.validarEnJuego()
		direccion = _direccion
		self.irA(_direccion.siguiente(self.position()))
	}

	method irA(nuevaPosicion) {
		self.validarEnergia()
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}
	
	method validarEnergia() {
		if (self.estaCansada()) {
			self.error("No tengo energía para volar")	
		}		
	}
	
	method comeYDesaparece(comida) { 
		self.come(comida)
		generadorAlimentos.remover(comida)
	}

	method comeComidasDebajo() {
		const comidas = game.colliders(self)
		comidas.forEach({comida => self.comeYDesaparece(comida)})
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return self.estaEnLaMismaPosicion(nido)
	}
	method teAtrapoSilvestre() {
		return self.estaEnLaMismaPosicion(silvestre)
	}
	
	method estaEnLaMismaPosicion(algo) {
		return position == algo.position()
//		return game.colliders(self).contains(algo)
	}
	
	method perdio() {
		return self.teAtrapoSilvestre() or self.estaCansada() 
	}
	
	method caerSiPodes() {
		if (position.y() > 0) {			
			position = position.down(1)  
		}
	}

}

