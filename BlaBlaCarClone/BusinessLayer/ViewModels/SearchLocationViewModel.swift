//
//  SearchViewModel.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 16/05/23.
//

import Foundation
import MapKit
import Combine

class SearchLocationViewModel: NSObject, ObservableObject {
    
    // MARK: Properties
    @Published var searchText = String()
    @Published var searchResults = [MKLocalSearchCompletion]()
    //    @Published var location: CLLocationCoordinate2D?
//    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var currentPlacemark: CLPlacemark?
    
    let locationManager = CLLocationManager()
    var publisher: AnyCancellable?
    
    // MKLocalSearchCompleter - This completer will help to get results using queryFragment
    // For that, we need to conform to the MKLocalSearchCompleterDelegate
    private lazy var localSearchCompleter: MKLocalSearchCompleter = {
        let completer = MKLocalSearchCompleter()
        completer.delegate = self
        return completer
    }()
    
    override init() {
        
//        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        self.publisher = $searchText
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] (str) in
            self?.localSearchCompleter.queryFragment = str
        })
    }
}

// MARK: - Extensions
extension SearchLocationViewModel: MKLocalSearchCompleterDelegate {
    
    /// results are set from the completer’s results
    /// - Parameter completer: MKLocalSearchCompleter - This completer will help to get results using queryFragment
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
    }
    
    /// method to handle if any error occurs while searching
    /// - Parameters:
    ///   - completer: MKLocalSearchCompleter - This completer will help to get results using queryFragment
    ///   - error: Error
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // Error when searchtext is empty when clearing the textfield
        print(error)
        // Change View to recent searches
    }
}

extension SearchLocationViewModel: CLLocationManagerDelegate {
    
    /// calling this method will trigger a prompt to request "when-in-use" authorization from the user.
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // location = locations.first?.coordinate
        fetchCountryAndCity(for: locations.first)
    }
    
    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, _) in
            self.currentPlacemark = placemarks?.first
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        checkLocationAuthorization()
//        authorizationStatus = manager.authorizationStatus
    }
    
    private func checkLocationAuthorization() {
            // guard let locationManager = locationManager else {return }
            
            switch locationManager.authorizationStatus {
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("restricted")
            case .denied:
                print("Go to settings to change request")
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.requestLocation()
            @unknown default:
                break
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error.localizedDescription)")
    }
}
