//
//  GasStationViewController.swift
//  iDriver
//
//  Created by Ako Kobaidze on 15.07.21.
//

import UIKit
import MapKit


class GasStationViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addCustomPin()
        mapView.delegate = self
 
        let pin1 = MKPointAnnotation()
        pin1.coordinate = CLLocationCoordinate2D(latitude: 41.716667, longitude: 44.783333)
        mapView.addAnnotation(pin1)
        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2D(latitude: 41.216667, longitude: 44.1833)
        mapView.addAnnotation(pin2)
        let pin3 = MKPointAnnotation()
        pin3.coordinate = CLLocationCoordinate2D(latitude: 41.116667, longitude: 44.283333)
        mapView.addAnnotation(pin3)
        let pin4 = MKPointAnnotation()
        pin4.coordinate = CLLocationCoordinate2D(latitude: 41.316667, longitude: 44.183333)
        mapView.addAnnotation(pin4)
        let pin5 = MKPointAnnotation()
        pin5.coordinate = CLLocationCoordinate2D(latitude: 41.116667, longitude: 44.383)
        mapView.addAnnotation(pin5)
        let pin6 = MKPointAnnotation()
        pin6.coordinate = CLLocationCoordinate2D(latitude: 41.26667, longitude: 44.183)
        mapView.addAnnotation(pin6)

    }
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.title = "Gulf"
        pin.subtitle = "ბენზინ გასამართი სადგური"
        mapView.addAnnotation(pin)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "Gulf")
        return annotationView
    }

    @IBAction func didClickOnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
   
}
