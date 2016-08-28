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
		
		let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satallite"])
		segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
		segmentedControl.selectedSegmentIndex = 0
		
		segmentedControl.addTarget(self,
		                           action: #selector( mapTypeChanged(_:) ),
		                           forControlEvents: .ValueChanged)
		
		// An older system for scaling interfaces - autoresizing masks.
		// These translated constraints will often conflict with explicit
		// constraints in the layout and cause an unsatisfiable constraints 
		// probem.
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(segmentedControl)
		
		let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
		let margins = view.layoutMarginsGuide
		let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
		let trailingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
		
		topConstraint.active = true
		leadingConstraint.active = true
		trailingConstraint.active = true
		
	}
	
	func mapTypeChanged(segControl: UISegmentedControl) {
		
		switch segControl.selectedSegmentIndex {
		case 0:
			mapView.mapType = .Standard
		case 1:
			mapView.mapType = .Hybrid
		case 2:
			mapView.mapType = .Satellite
		default:
			break
		}
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("MapViewController loaded its view")
	}
	
}
