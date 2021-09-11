package hu.bme.aut.erlabor.parceltracker.dao.parcel;

import hu.bme.aut.erlabor.parceltracker.Parcel;

import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:appContext.xml")
@Transactional
public class ParcelRepositoryIT {

	@Autowired
	ParcelRepository parcelRepository;
	
	@Test
	public void testFindByTrackingNumber(){
		parcelRepository.save(Arrays.asList(
				new Parcel(1L, "ABC"), 
				new Parcel(2L, "DEF"), 
				new Parcel(3L, "GHI")));
		
		Parcel parcel = parcelRepository.findByTrackingNumber("DEF");
		assertEquals(2L, parcel.getParcelId());
	}
	
	@Test
	public void testCityPrefixSearch(){
		
		parcelRepository.save(Arrays.asList(
				new Parcel(1L, "ABC", "DEF"), 
				new Parcel(2L, "ABC2", "JKL"), 
				new Parcel(3L, "MNO", "DEF2")));
		
		List<Parcel> parcels = parcelRepository.findBySenderCityStartingWithAndReceiverCityStartingWith("A", "D");
		assertEquals(1, parcels.size());
		assertEquals(1L, parcels.get(0).getParcelId());
		
		parcels = parcelRepository.findBySenderCityStartingWithAndReceiverCityStartingWith("A", "J");
		assertEquals(1, parcels.size());
		assertEquals(2L, parcels.get(0).getParcelId());
		
		parcels = parcelRepository.findBySenderCityStartingWithAndReceiverCityStartingWith("MNO", "D");
		assertEquals(1, parcels.size());
		assertEquals(3L, parcels.get(0).getParcelId());
		
		parcels = parcelRepository.findBySenderCityStartingWithAndReceiverCityStartingWith("A", "");
		assertEquals(2, parcels.size());
		assertEquals(1L, parcels.get(0).getParcelId());
		assertEquals(2L, parcels.get(1).getParcelId());
		
		parcels = parcelRepository.findBySenderCityStartingWithAndReceiverCityStartingWith("", "D");
		assertEquals(2, parcels.size());
		assertEquals(1L, parcels.get(0).getParcelId());
		assertEquals(3L, parcels.get(1).getParcelId());
	}
	
}
