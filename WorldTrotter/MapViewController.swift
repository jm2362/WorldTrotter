//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Jeff Meehan on 8/28/16.
//  Copyright © 2016 Jeff Meehan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
	// When a view controller is created, its view property is nil.
	var mapView: MKMapView!
	
	// If a view controller is asked for its view and its vies is nil,
	// then the loadView method is called.
	override func loadView() {
		// Create a map view.
		mapView = MKMapView()
		
		// Set it as *the* view of this view controller.
		view = mapView
		
		let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
		segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
		
		// An older system for scaling interfaces - autoresizing masks.
		// These translated constraints will often conflict with explicit
		// constraints in the layout and cause an unsatisfiable constraints 
		// probem.
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(segmentedControl)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("MapViewController loaded its view")
	}
	
}
