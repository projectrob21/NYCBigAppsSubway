//
//  MapView.swift
//  BigAppsSubway
//
//  Created by Robert Deans on 3/20/17.
//  Copyright © 2017 Robert Deans. All rights reserved.
//

import SnapKit
import GoogleMaps

class MapView: UIView {
    
    // MARK: Properties
    
    let store = DataStore.sharedInstance
    
    var camera: GMSCameraPosition!
    var stationsMap: GMSMapView!
    var markerArray = [GMSMarker]()
    
    weak var filterBranchesDelegate: FilterBranchesDelegate?
    weak var napperAlarmsDelegate: NapperAlarmsDelegate?
    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        configure()
        constrain()
    }
    
    
    // MARK: View Configuration
    func configure() {
        
        camera = GMSCameraPosition.camera(withLatitude: 40.7485, longitude: -73.9854, zoom: 11)
        stationsMap = GMSMapView.map(withFrame: .zero, camera: camera)
        stationsMap.isMyLocationEnabled = true
        stationsMap.settings.myLocationButton = true
        stationsMap.mapType = .normal
        stationsMap.delegate = self
        


    }
    
    // MARK: View Constraints
    func constrain() {
        
        addSubview(stationsMap)
        stationsMap.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

extension MapView: AddToMapDelegate {
    
    
    func addStationsToMap(stations: StationDictionary) {
        stationsMap.clear()
        
        for (_, station) in stations {
            
            let marker = GMSMarker()
            marker.position = station.coordinate2D
            marker.isFlat = true
            
            if !station.isHidden {
                marker.map = stationsMap
            }
        }
    }
}

extension MapView: GMSMapViewDelegate {
    
}
