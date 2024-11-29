import aparatos.*

class Paciente{
  var edad
  var fortalezaMuscular
  var dolor
  const property rutina = []

  method edad() = edad

  method cumplirAnios(){
    edad += 1
  }
  
  method puedeUsar(unAparato){
    return unAparato.puedeSerUsado(self)
  }

  method disminuirDolor(unValor){
    dolor = 0.max(dolor - unValor)
  }

  method aumentarFortalezaMuscular(unValor){
    fortalezaMuscular += unValor
  }

  method dolor() = dolor

  method fortalezaMuscular() = fortalezaMuscular
  
  method usarAparato(unAparato){
    if (self.puedeUsar(unAparato)){
      unAparato.consecuenciasDelUso(self)
    }
  }
  method puedeHacerRutina(){
    return rutina.all({a => a.puedeSerUsado(self)})
  }
  method realizarRutina(){
    if (self.puedeHacerRutina()){
      rutina.forEach({a => self.usarAparato(a)})
    }
  }
}

class Resistente inherits Paciente{
  override method realizarRutina(){
    super()
    self.aumentarFortalezaMuscular(rutina.size())
    
  } 
}

class Caprichoso inherits Paciente{
  method hayAlgunAparatoDeColorRojo(){
    return rutina.any({a => a.color() == "rojo"})
  }

  override method realizarRutina() {
    if (self.hayAlgunAparatoDeColorRojo()){
      rutina.forEach({a => self.usarAparato(a)})
      rutina.forEach({a => self.usarAparato(a)})
    }
  }
}

class RapidaRecuperarion inherits Paciente{
  override method realizarRutina(){
    super()
    self.disminuirDolor(dolormMenos.dolor())
  }
}

object dolormMenos {
  var property dolor = 3
}