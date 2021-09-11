package hu.bme.aut.erlabor.parceltracker.dao.parcel;

import java.util.List;

import hu.bme.aut.erlabor.parceltracker.Parcel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParcelRepository extends JpaRepository<Parcel, Long>{

	Parcel findByTrackingNumber(String trackingNumber);
	
	List<Parcel> findBySenderCityStartingWithAndReceiverCityStartingWith(String senderCity, String receiverCity);
}
