import geografia.*

class Vendedor {
	var certificaciones = []
	
	method agregarCertificacion(unaCertificacion) {certificaciones.add(unaCertificacion)}
	method certificaciones() {return certificaciones}
	
	method puedeTrabajarEn(unaCiudad)
	method esInfluyente()
	method esVersatil() {
		return certificaciones.size() >= 3 and
		certificaciones.any({c=>c.esPorObjeto()}) and
		certificaciones.any({c=> not c.esPorObjeto()})
	}
	method esFirme() {return self.puntajeTotal() > 30}
	
	method puntajeTotal() { return certificaciones.sum({c=>c.puntos()}) }
	
	method esGenerico() {return certificaciones.any({c=> not c.esPorObjeto()})}
	
	method tieneAfinidad(unCentro) {return self.puedeTrabajarEn(unCentro.ciudad())}
	
	method esVendedorCandidato(unCentro) {return self.esVersatil() and self.tieneAfinidad(unCentro)}
	
	
}

class VendedorFijo inherits Vendedor{
	var property dondeVive
	
	override method puedeTrabajarEn(unaCiudad) {
		return self.dondeVive() == unaCiudad
	}
	
	override method esInfluyente() {return false}
}

class Viajante inherits Vendedor {
	var provinciasHabilitadas = []
	
	method agregarProvincia(unaCiudad) {provinciasHabilitadas.addAll(unaCiudad)}
	method provinciasHabilitadas() {return provinciasHabilitadas}
	
	override method puedeTrabajarEn(unaCiudad) {
		 return provinciasHabilitadas.any({p => p == unaCiudad.provincia()})
	}
	
	override method esInfluyente() {
		return provinciasHabilitadas.sum({p=>p.poblacion()}) >=  10000000
	}
}

class ComercioCorresponsal inherits Vendedor{
	var sucursales = []
	
	method agregarSucursal(unaCiudad) {sucursales.addAll(unaCiudad)}
	method sucursales() {return sucursales}
	
	override method puedeTrabajarEn(unaCiudad) {
		return sucursales.contains(unaCiudad)
	}
	
	override method esInfluyente() {
		return sucursales.size() >= 5 //repasar
	}
	
	override method tieneAfinidad(unCentro) {
		return super(unCentro) and sucursales.any({s=> not unCentro.puedeCubrir(s)})
	}
}

class Certificaciones{
	var property puntos
	var property esPorObjeto = true	
}