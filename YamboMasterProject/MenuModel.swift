//
//  MenuModel.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/24/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

enum ContentType: String, CustomStringConvertible {
    
    case mensajes = "mensajes.png"
    case calendario = "calendario.png"
    case reservaciones = "reservaciones.png"
    case acciones = "acciones.png"
    case cobrosYPagos = "yamboLogo.png"
    case solicitudes = "heart.png"
    
    var menuPhotoName: ContentType {
        switch self {
        case .mensajes:
            return .mensajes
        case .calendario:
            return .calendario
        case .reservaciones:
            return .reservaciones
        case .acciones:
            return  .acciones
        case .cobrosYPagos:
            return .cobrosYPagos
        case .solicitudes:
            return .solicitudes
        }
    }
    
    func next(itemAt: Int) -> ContentType {
        switch menuPhotoName {
        case .mensajes:
            return .mensajes
        case .calendario:
            return .calendario
        case .reservaciones:
            return .reservaciones
        case .acciones:
            return .acciones
        case .cobrosYPagos:
            return .cobrosYPagos
        case .solicitudes:
            return .solicitudes
            
        }
    }
    
    var image: UIImage {
        let image =  UIImage(named: rawValue)!
        return image
    }
    
    var description: String {
        switch self {
        case .mensajes:
            return "Mensajes"
        case .calendario:
            return "Calendario"
        case .reservaciones:
            return "Reservaciones"
        case .acciones:
            return "Acciones"
        case .cobrosYPagos:
            return "Cobros Y Pagos"
        case .solicitudes:
            return "Solicitudes"
        }
    }
}
