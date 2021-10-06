import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() { return "nido.png" }

	method teEncontro(ave) {
		game.stop()
	}
}

object silvestre {

	method image() = "silvestre.png"
//	method image() { return "silvestre.png" } 

	method position() = game.at(self.x(), 0)
	
	method x() {
		return pepita.position().x().max(3) 
	}

}

