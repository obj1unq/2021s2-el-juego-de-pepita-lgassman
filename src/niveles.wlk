import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(new Manzana())
		game.addVisual(new Alpiste())
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(new Manzana())
		game.addVisual(new Alpiste())
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
		config.configurarColisiones()
	}

}
object tutorial4 {

	method iniciar() {
//		game.addVisual(new Manzana())
//		game.addVisual(new Manzana(position=game.at(4,6)))
//		game.addVisual(new Alpiste())
//		game.addVisual(new Alpiste(position=game.at(7,7), peso=50))
		
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
		config.configurarColisiones()
		config.configurarAlimentos()
	}

}

object config {

	method configurarTeclas() {
		// Esto se podría hacer mejor, pero lo dejaremos así por ahora.
		//keyboard.left().onPressDo( { pepita.irA( pepita.position().left(1) )  })
		keyboard.left().onPressDo( { pepita.mover(izquierda)  })
		//keyboard.right().onPressDo({ pepita.irA( pepita.position().right(1)) })
		keyboard.right().onPressDo({ pepita.mover(derecha) })
		keyboard.up().onPressDo({ pepita.mover(arriba) })
		keyboard.down().onPressDo({ pepita.mover(abajo) })
		
	//	keyboard.c().onPressDo({ pepita.comeComidasDebajo() })
	}
	
	method configurarGravedad() {
		game.onTick(800, "GRAVEDAD", { pepita.caerSiPodes() })
		
//		Si lo quiero frenar
//		game.removeTickEvent("GRAVEDAD")
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, {algo => algo.teEncontro(pepita)})

//		game.onCollideDo(nido, { personaje => personaje.ganar()})
//		game.onCollideDo(silvestre, { personaje => personaje.perder()})
	}
	
	method configurarAlimentos() {
		game.onTick(3000, "ALIMENTOS", { generadorAlimentos.agregarAlimento()})
	}

}

