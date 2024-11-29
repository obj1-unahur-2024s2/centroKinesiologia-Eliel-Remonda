import pacientes.*
class Aparato{
    var property color = "blanco"
    method puedeSerUsado(unPaciente)
    method consecuenciasDelUso(unPaciente)
    method necesitaMantenimiento()
    method realizarMantenimiento(){}
}
class Magneto inherits Aparato{
    var imantacion = 800
    override method consecuenciasDelUso(unPaciente){
        unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
        imantacion -= 1
    }

    override method necesitaMantenimiento(){
        return imantacion < 100
    }

    override method realizarMantenimiento(){
        imantacion = 800.min(imantacion + 500)
    }

    override method puedeSerUsado(unPaciente) = true
}

class Bicicleta inherits Aparato{
    var tornillos = 0
    var aceite = 0

    override method consecuenciasDelUso(unPaciente){
        if (unPaciente.dolor() >= 30){
            tornillos +=1
            if (unPaciente.edad().between(30, 50)){
                aceite += 1
            }
        }
        unPaciente.disminuirDolor(4)
        unPaciente.aumentarFortalezaMuscular(3)

    }

    override method puedeSerUsado(unPaciente){
        unPaciente.edad() > 8
    }

    override method necesitaMantenimiento(){
        return tornillos >= 10 or aceite >= 5
    }

    override method realizarMantenimiento(){
        tornillos = 0
        aceite = 0
    }

}
class Minitramp inherits Aparato{

    override method consecuenciasDelUso(unPaciente){
        unPaciente.aumentarFortalezaMuscular(unPaciente.edad() * 0.1)
    }

    override method puedeSerUsado(unPaciente){
        unPaciente.dolor() < 20
    }

    override method necesitaMantenimiento() = false
}