package hu.bme.aut.erlabor.parceltracker.service;

import hu.bme.aut.erlabor.parceltracker.Parcel;
import hu.bme.aut.erlabor.parceltracker.ParcelEvent;
import hu.bme.aut.erlabor.parceltracker.ParcelEvent.Status;
import hu.bme.aut.erlabor.parceltracker.dao.event.ParcelEventRepository;
import hu.bme.aut.erlabor.parceltracker.dao.parcel.ParcelRepository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class TrackerServiceTest {

	@InjectMocks
	TrackerService trackerService;
	
	@Mock
	ParcelRepository parcelRepository;
	
	@Mock
	ParcelEventRepository parcelEventRepository;
	
	@Before
	public void init(){
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testBasicSearch(){
		
		List<ParcelEvent> events = Arrays.asList(new ParcelEvent[]{
			new ParcelEvent(1L, 2L, Status.DELIVERED, new Date()),
			new ParcelEvent(2L, 2L, Status.POSTED, new Date())
		});
		
		when(parcelEventRepository.findByParcelIdInOrderByDateTime(Arrays.asList(2L))).thenReturn(events);
		when(parcelRepository.findByTrackingNumber("ABC")).thenReturn(new Parcel(2L, "ABC"));
		
		Parcel parcel = trackerService.basicSearch("ABC");
		assertNotNull(parcel);
		
		List<ParcelEvent> resultEvents = parcel.getEvents();
		assertNotNull(resultEvents);
		assertEquals(2, resultEvents.size());
	}

	@Test	
	public void testFetchEventsForParcelsForNullOrEmptyList(){
		try{
			trackerService.fetchEventsForParcels(null);
		}catch(Exception e){
			e.printStackTrace();
			fail(e.getMessage());
		}
		
		try{
			trackerService.fetchEventsForParcels(Collections.emptyList());
		}catch(Exception e){
			e.printStackTrace();
			fail(e.getMessage());
		}
	}
	
	@Test
	public void perfTestFetchEventsForParcels(){
		int NUM_PARCEL = 10000;
		int EVENT_PER_PARCEL = 100;
		List<Parcel> parcels = new ArrayList<>();
		List<ParcelEvent> events = new ArrayList<>();
		
		for(int i=0; i< NUM_PARCEL; i++){
			parcels.add(new Parcel(i, "t" + i));
			for(int j=0; j< EVENT_PER_PARCEL; j++){
				events.add(new ParcelEvent(j, i, Status.POSTED, null));
			}
		}
		Collections.shuffle(events);
		
		when(parcelEventRepository.findByParcelIdInOrderByDateTime(any())).thenReturn(events);
		
		long now = System.currentTimeMillis();
		trackerService.fetchEventsForParcels(parcels);
		
		System.out.format("Fetching parcels took %d ms.%n", (System.currentTimeMillis()-now));
		
		assertEquals(NUM_PARCEL, parcels.size());
		for(Parcel parcel: parcels){
			List<ParcelEvent> eventsOfParcel = parcel.getEvents();
			assertEquals(eventsOfParcel.size(), EVENT_PER_PARCEL);
			
			for(ParcelEvent event: eventsOfParcel){
				assertEquals(parcel.getParcelId(), event.getParcelId());
			}
		}
	}
	
}
