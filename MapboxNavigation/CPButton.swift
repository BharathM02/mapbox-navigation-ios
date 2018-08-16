import Foundation
#if canImport(CarPlay)
import CarPlay
@available(iOS 12.0, *)
extension CPBarButton {
    
    public static func panButton(for mapView: MGLMapView, mapTemplate: CPMapTemplate) -> CPBarButton {
        let panButton = CPBarButton(type: .text) { (button) in
            if mapTemplate.isPanningInterfaceVisible {
                button.title = "Pan map"
                mapTemplate.dismissPanningInterface(animated: true)
                mapView.userTrackingMode = .follow
            } else {
                button.title = "Dismiss"
                mapTemplate.showPanningInterface(animated: true)
            }
        }
        
        panButton.title = "Pan map"
        
        return panButton
    }
    
    public static func searchButton(for mapView: MGLMapView, mapTemplate: CPMapTemplate) -> CPBarButton {
        let searchButton = CPBarButton(type: .image) { button in
            mapTemplate.showPanningInterface(animated: true)
        }
        searchButton.image = UIImage(named: "search-monocle", in: .mapboxNavigation, compatibleWith: nil)
        return searchButton
    }
    
    public static func favoriteButton(for mapView: MGLMapView, mapTemplate: CPMapTemplate) -> CPBarButton {
        let favoriteButton = CPBarButton(type: .image) { button in
            mapTemplate.showPanningInterface(animated: true)
        }
        favoriteButton.image = UIImage(named: "star", in: .mapboxNavigation, compatibleWith: nil)
        return favoriteButton
    }
}
#endif