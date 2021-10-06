import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return 	if (self.perdio()) "pepita-gris.png" 
				else if (self.estaEnElNido()) "pepita-grande.png" 
				else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
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
		game.removeVisual(comida)
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

