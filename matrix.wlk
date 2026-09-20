object neo {
    var energia = 100
    
    method energia() = energia 
    method esElElegido() = true 
    method saltar(){
        energia = energia / 2
    }
    method vitalidad() = energia / 10

}

object morfeo {
    var vitalidad = 8
    var estaCansado = false
    method esElElegido() = false 
    method vitalidad() = vitalidad 
    method saltar() {
        estaCansado = !estaCansado
        vitalidad = (vitalidad - 1).max(0)
    }
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {}
}

object nave {
    const pasajeros = []
    method pasajeros() = pasajeros 
    method subirPasajeros(unPasajero) {
        pasajeros.add(unPasajero)
    }
    method bajarPasajeros(unPasajeros) {
        pasajeros.remove(unPasajeros)
    }
    method cantPasajeros() = pasajeros.size() 
    method pasajeroMayorVitalidad() {
        return pasajeros.max({p => p.vitalidad()})
    } 
    method estaElElegido() {
        return pasajeros.any({p => p.esElElegido()})
    }
    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }
    method acelerar(){
        pasajeros.filter({p => !p.esElElegido()}).forEach({p => p.saltar()})
        pasajeros.forEach({p => if (!p.esElElegido()) p.saltar()}) 
    }
}