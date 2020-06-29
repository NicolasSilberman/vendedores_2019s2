import geografia.*
import vendedores.*

class Cliente{
	method puedeSerAtendido(unVendedor)
}

class ClienteInseguro inherits Cliente{
	override method puedeSerAtendido(unVendedor) {return unVendedor.esVersatil() and unVendedor.esFirme()}
}

class ClienteDetallista inherits Cliente{
	override method puedeSerAtendido(unVendedor) {return unVendedor.certificadosPorProductos() >= 3}
}

class ClienteHumanista inherits Cliente{
	override method puedeSerAtendido(unVendedor) {return unVendedor.esPersonaFisica()}
}