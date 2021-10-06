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
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object config {

	method configurarTeclas() {
		// Esto se podría hacer mejor, pero lo dejaremos así por ahora.
		keyboard.left().onPressDo( { pepita.irA( pepita.position().left(1) )  })
		keyboard.right().onPressDo({ pepita.irA( pepita.position().right(1)) })
		keyboard.up().onPressDo({ pepita.irA( pepita.position().up(1)) })
		keyboard.down().onPressDo({ pepita.irA( pepita.position().down(1)) })
		
		keyboard.c().onPressDo({ pepita.comeComidasDebajo() })
	}
	
	method configurarGravedad() {
		game.onTick(800, "GRAVEDAD", { pepita.caerSiPodes() })
		
//		Si lo quiero frenar
//		game.removeTickEvent("GRAVEDAD")
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

}

