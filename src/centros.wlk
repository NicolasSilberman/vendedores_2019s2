import geografia.*
import vendedores.*

class CentroDistribucion {
	var property ciudad
	var vendedores = []
	
	method agregarVendedor(unVendedor) {
		if(vendedores.contains(unVendedor)) {self.error("el vendedor ya esta registrado")}
		else {vendedores.add(unVendedor)}
	}
	
	method vendedores() {return vendedores}
	
	method vendedorEstrella() {return vendedores.max({ve=>ve.puntajeTotal()}) } 
	
	method puedeCubrir(unaCiudad) {return vendedores.any({v=>v.puedeTrabajarEn(unaCiudad)})}
	
	method vendedoresGenericos() {return vendedores.filter({v=>v.esGenerico()})}
	
	method esRobusto() {return vendedores.count({v=>v.esFirme()}) >= 3}
	
	method repartirCertificacion(unaCertificacion) {
		vendedores.forEach({v=>v.agregarCertificacion(unaCertificacion)})
	}
}
