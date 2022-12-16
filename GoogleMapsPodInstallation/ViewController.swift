//
//  ViewController.swift
//  GoogleMapsPodInstallation
//
//  Created by Apple on 11/11/22.
//

import UIKit
import GoogleMaps
import SDWebImage
class ViewController: UIViewController, GMSMapViewDelegate {
    
  
    @IBOutlet var mapView: GMSMapView!
    
    @IBOutlet var imageView: UIImageView!
    
    var marker = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addCameraSettingOnMap()
        addMarkerOnMap(position: CLLocationCoordinate2D(latitude: 18.3663, longitude: 73.7559))
        mapView.mapType = .normal
        initializingSettingOnMap()
        drawCircle()
        drawRectangle()
        //drawPolygon()
        drawPolyLine()
       let imageUrl = NSURL(string: "https://dummyjson.com/image/i/products/7/2.jpg")
        imageView.sd_setImage(with: imageUrl as! URL)
    }
    func initializingSettingOnMap(){
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.scrollGestures = true
        mapView.settings.myLocationButton = true
        mapView.settings.tiltGestures = true
        mapView.isMyLocationEnabled = true
    }
    func addCameraSettingOnMap(){
        let camera = GMSCameraPosition(latitude: 18.3663, longitude: 73.7559, zoom: 20.0)
        mapView.camera = camera
    }
    func addMarkerOnMap(position : CLLocationCoordinate2D){
        
        marker.position = position
        marker.title = "Sinhgad Fort"
        marker.snippet = "This is sinhgad fort"
        marker.map = mapView
        //marker.icon = UIImage(named: "images")
    }
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
            print("did Begin Dragging Method Called\(marker.position)")
        }
        
        func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
            print("Did Drag Method Called\(marker.position)")
        }
        
        func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
            print("Did End Dragging Method Called \(marker.position)")
        }
        func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("did tap info window method called \(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("did long press info window method called\(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("did Tap Method Called \(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = .magenta
        view.alpha = 0.3
        view.layer.cornerRadius = 4
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.width - 15, height: 100))
        label.text = "sinhgad"
        label.textColor = .black
        label.alpha = 0.9
        label.backgroundColor = .cyan
        label.textAlignment = .center
        view.addSubview(label)
        let label2 = UILabel(frame: CGRect(x: 10, y: 120, width: view.frame.width - 15, height: 70))
        label2.text = "fort"
        label2.textColor = .black
        label2.alpha = 0.9
        label2.backgroundColor = .cyan
        label2.textAlignment = .center
        view.addSubview(label2)
        return view
    }
    func drawCircle(){
        let drawCircle = CLLocationCoordinate2D(latitude: 18.3663, longitude: 73.7559)
        let circle = GMSCircle(position: drawCircle, radius: 1000)
        circle.map = mapView
        circle.fillColor = .green
        circle.strokeColor = .white
        circle.strokeWidth = 2
        //circle.fillColor = UIColor(red: 0.25, green: 0.25, blue: 0, alpha: 0.5)
        circle.zIndex = 5
        
    }
    func drawRectangle(){
            let pathForRectangle = GMSMutablePath()
        pathForRectangle.add(CLLocationCoordinate2D(latitude: 26.91, longitude: 75.78))
        pathForRectangle.add(CLLocationCoordinate2D(latitude: 22.71, longitude: 75.85))
        pathForRectangle.add(CLLocationCoordinate2D(latitude: 23.18, longitude: 79.98))
        pathForRectangle.add(CLLocationCoordinate2D(latitude: 26.44, longitude: 80.33))
            
            
        let rectangle = GMSPolygon(path: pathForRectangle)
        rectangle.map = mapView
        rectangle.fillColor = UIColor(red: 0.25, green: 0.25, blue: 0.20, alpha: 0.8)
        rectangle.strokeWidth = 5
        rectangle.strokeColor = UIColor.blue
        rectangle.zIndex = 5
      
        }
    /*func drawPolygon(){
        let pathForPolygon = GMSMutablePath()
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 41.20, longitude: 74.76))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 33.22, longitude: 43.67))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 15.55, longitude: 48.51))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 7.87, longitude: 80.77))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 15.87, longitude: 100.99))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 35.86, longitude: 104.19))
        let polygon = GMSPolygon(path: pathForPolygon)
        polygon.map = mapView
        polygon.fillColor = .purple
        polygon.strokeWidth = 2
        polygon.strokeColor = .white
        polygon.zIndex = 5
        
        
    }*/
    func drawPolyLine(){
        let pathForPolyLine = GMSMutablePath()
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.85))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 19.99, longitude: 73.78))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 19.09, longitude: 74.74))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.85))
        
        let polyLine = GMSPolyline(path: pathForPolyLine)
        polyLine.strokeColor = .red
        polyLine.strokeWidth = 5
        polyLine.map = mapView
        polyLine.zIndex = 5
        
    }
    
}

