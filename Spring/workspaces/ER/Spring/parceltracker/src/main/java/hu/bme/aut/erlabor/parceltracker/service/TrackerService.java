package hu.bme.aut.erlabor.parceltracker.service;

import hu.bme.aut.erlabor.parceltracker.Parcel;
import hu.bme.aut.erlabor.parceltracker.ParcelEvent;
import hu.bme.aut.erlabor.parceltracker.dao.event.ParcelEventRepository;
import hu.bme.aut.erlabor.parceltracker.dao.parcel.ParcelRepository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class TrackerService {

	@Autowired
	ParcelRepository parcelRepository;
	
	@Autowired
	ParcelEventRepository parcelEventRepository;
	
	
	public Parcel basicSearch(String trackingNumber){
		Parcel parcel = parcelRepository.findByTrackingNumber(trackingNumber);
		fetchEventsForParcel(parcel);
		return parcel;
	}
	
	@Cacheable("citySearchResults")
	public List<Parcel> citySearch(String fromCity, String toCity){
		List<Parcel> parcels = parcelRepository.findBySenderCityStartingWithAndReceiverCityStartingWith(fromCity, toCity);
		fetchEventsForParcels(parcels);
		return parcels;
	}


	private void fetchEventsForParcel(Parcel parcel) {
		if(parcel!= null)
			fetchEventsForParcels(Arrays.asList(parcel));
	}


	protected void fetchEventsForParcels(List<Parcel> parcels) {

		if(parcels == null || parcels.isEmpty())
			return;
		
		//összegyûjtjük az parcel id-ket egy listába
		List<Long> parcelIds = new ArrayList<>();
		for (Parcel parcel : parcels) {
			parcelIds.add(parcel.getParcelId());
		}
		
		//megkeressük a parcelid-k alapján az eventeket
		List<ParcelEvent> events = parcelEventRepository.findByParcelIdInOrderByDateTime(parcelIds);
		
		Map<Long, List<ParcelEvent>> parcelIdsMappedToEvents = new LinkedHashMap<Long, List<ParcelEvent>>();
		for (long parcelId : parcelIds) {
			parcelIdsMappedToEvents.put(parcelId, new ArrayList<ParcelEvent>());
		}
		for (ParcelEvent event : events) {
			List<ParcelEvent> assignedEvents = parcelIdsMappedToEvents.get(event.getParcelId());
			assignedEvents.add(event);
		}
		for (Parcel parcel : parcels) {
			parcel.setEvents(parcelIdsMappedToEvents.get(parcel.getParcelId()));
		}	
	}
}
