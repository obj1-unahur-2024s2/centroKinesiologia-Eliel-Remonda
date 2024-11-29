import pacientes.*
import aparatos.*


object centro {
    const property aparatos = []
    const property pacientes = []

    method agregarPaciente(unPaciente){
        pacientes.add(unPaciente)
    }

    method agregarAparato(unAparato){
        aparatos.add(unAparato)
    }

    method colorDeLosAparatos(){
        return aparatos.map({a => a.color()}).asSet()
    }
    method pacientesMenore(unaEdad){
        return pacientes.count({p => p.edad() == unaEdad})
    }

    method cantPacientesNoPuedenHacerSesion(){
        return pacientes.count({p => not p.puedeHacerRutina()})
    }

    method estaEnOptimasCondiciones(){
        return aparatos.all({a => not a.necesitaMantenimiento()})
    }

    method aparatosNecesitanMantenimiento(){
        return aparatos.count({a => a.necesitaMantenimiento()})
    }

    method estaComplicado(){
        return aparatos.size() * 0.5 <= self.aparatosNecesitanMantenimiento()
    }

    method realizarMantenimientoPorUnTecnico(){
        return self.aparatosSinMantenimiento().forEach({a => a.realizarMantenimiento()})
    }

    method aparatosSinMantenimiento(){
        return aparatos.filter({a => a.necesitaMantenimiento()})
    }
}