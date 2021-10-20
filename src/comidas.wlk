import wollok.game.*
import randomizer.*

class Manzana {

	const property position = game.at(1, 8)
	
	method image() = "manzana.png"

	method energiaQueOtorga() = 40
	
	method teEncontro(ave) {
		ave.comeYDesaparece(self)	
	}

}

class Alpiste {

	const property position = game.at(2, 2)
	const peso = 70

	method image() = "alpiste.png"
		
	method energiaQueOtorga() {
		return peso
	}

	method teEncontro(ave) {
		ave.comeYDesaparece(self)	
	}

}

object manzanaFactory {
	
	method nuevoAlimento() {
		return new Manzana(position=randomizer.emptyPosition())
	}
}

object alpisteFactory {
	
	method nuevoAlimento() {
		return new Alpiste(position=randomizer.emptyPosition(), peso=(40..100).anyOne())
	}
}


object generadorAlimentos {
	
	const alimentos = #{}
	const max = 3 
	const factoriesAlimentos = [  manzanaFactory, alpisteFactory ]
	
	method agregarAlimento() {
		if(self.hayQueAgregar()) {
			const alimento = self.generarNuevaComida() 
			game.addVisual(alimento)
			alimentos.add(alimento)
		}
	}
	
	method hayQueAgregar() {
		return alimentos.size() < max
	}
	
	method remover(comida) {
		alimentos.remove(comida)
		game.removeVisual(comida)
	}
	
	method generarNuevaComida() {
		const indiceAleatorio = (0 .. factoriesAlimentos.size() -1).anyOne()
		const factory = factoriesAlimentos.get(indiceAleatorio)
		return factory.nuevoAlimento()
	}
			
}

