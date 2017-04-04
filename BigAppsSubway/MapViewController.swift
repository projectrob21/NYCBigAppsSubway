//
//  ViewController.swift
//  BigAppsSubway
//
//  Created by Robert Deans on 3/20/17.
//  Copyright © 2017 Robert Deans. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    static let rider = Rider(coordinate: nil)
    let store = DataStore.sharedInstance
    
    let mapView = MapView()
    let mapViewModel = MapViewModel()
    let destinationViewModel = DestinationViewModel(rider: rider)
    let locationViewModel = LocationViewModel(rider: rider)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.napperAlarmsDelegate = destinationViewModel
        mapViewModel.addToMapDelegate = mapView
        destinationViewModel.regionsToMonitorDelegate = locationViewModel
        
        mapView.addStationsToMap(stations: mapViewModel.stations)
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

