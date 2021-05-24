//
//  MapViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 20.05.2021.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let modelUser = ModelUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        for user in modelUser.users.first!{
            mapView.addAnnotation(user)
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnable()
    }
    func checkLocationEnable(){
        if CLLocationManager.locationServicesEnabled(){
            setupManager()
            checkAuthorization()
        }else{
            showAlertLocation(title:"У вас выключена служба геолокации", message: "Хотите включить?",url:URL(string:"App-prefs:root=LOCATION_SERVICES"))
        }
        
    }
    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func checkAuthorization(){
        switch locationManager.authorizationStatus{
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlertLocation(title: "Вы запретили использование местоположения", message: "Хотите изменить?",url:URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
                }
    }
    func showAlertLocation(title: String, message: String?,url:URL?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let settings = UIAlertAction(title: "Настройки", style: .default) { (alert) in
             if let url = url{
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
             }
         }
         let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
         alert.addAction(settings)
         alert.addAction(cancel)
         present(alert, animated: true, completion: nil)
        
    }

}
extension MapViewController:CLLocationManagerDelegate,MKMapViewDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorization()
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? User else{return nil}
        var viewMarker: MKMarkerAnnotationView
        let idView = "marker"
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: idView) as? MKMarkerAnnotationView{
            view.annotation = annotation
            viewMarker = view
        }else{
            viewMarker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: idView)
            viewMarker.canShowCallout = true
            viewMarker.calloutOffset = CGPoint(x: 0, y: 6)
            viewMarker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return viewMarker
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let coordinate = locationManager.location?.coordinate else{return}
        self.mapView.removeOverlays(mapView.overlays)
        let user = view.annotation as! User
        let startPoint = MKPlacemark(coordinate: coordinate)
        let endPoint = MKPlacemark(coordinate: user.coordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startPoint)
        request.destination = MKMapItem(placemark: endPoint)
        request.transportType = .automobile
        
        let direction = MKDirections(request: request)
        direction.calculate { (response, error) in
            guard let response = response else {return}
            for route in response.routes{
                self.mapView.addOverlay(route.polyline)
                
            }
        }
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = 4
        return renderer
    }
    
}
