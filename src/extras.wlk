import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(3, 5)

	method image() { return "nido.png" }
	
	method teEncontro(ave) {
		ave.ganar()
	}

}

object silvestre {

	method image() = "silvestre.png"
//	method image() { return "silvestre.png" } 

	method position() = game.at(self.x(), 0)
	
	method x() {
		return pepita.position().x().max(3) 
	}
	
	method teEncontro(ave) {
		ave.perder()
	}
	

}

