//
//  DivisionPairImpair.swift
//  
//
//  Created by Ambroise COLLON on 28/07/2017.
//
//

func diviserNombrePairParDeux(x: Int) -> Int {
    return x / 2
}

func diviserNombreImpairParDeux(x: Int) -> Int {
    return (x + 1) / 2
}


func obtenirDivision(x: Int) -> (Int) -> (Int) {
    if (x % 2 == 0) {
        return diviserNombrePairParDeux(x:)
    } else {
        return diviserNombreImpairParDeux(x:)
    }
}

let tableau = [2, 12, 3, 14, 76, 19, 7, 22]
var somme = 0

for nombre in tableau {
    let division = obtenirDivision(x: nombre)
    division(nombre)
    somme += division(nombre)
}
