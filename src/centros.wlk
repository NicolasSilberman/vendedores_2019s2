import geografia.*
import vendedores.*

class CentroDistribucion {
	var property ciudad
	var vendedores = []
	
	method agregarVendedor(unVendedor) {
		if(vendedores.contains({unVendedor})) {self.error("el vendedor ya esta registrado")}
		else {vendedores.add(unVendedor)}
	}
	
	method vendedorEstrella() {return vendedores.max({v=>v.puntajeTotal()})} //repasar
	
	method puedeCubrir(unaCiudad) {return vendedores.any({v=>v.puedeTrabajarEn(unaCiudad)})}
	
	method vendedoresGenericos() {}
	
	method esRobusto() {return vendedores.count({v=>v.esFirme()}) >= 3}
	
	method repartirCertificacion(unaCertificacion) {vendedores.agregarCertificacion(unaCertificacion)}
}
