package hu.bme.aut.erlabor.parceltracker;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Parcel implements Serializable{

	private static final long serialVersionUID = 4348587796490121970L;

	@Id
	private long parcelId;
	
	private String trackingNumber;
	
	private String senderCountry;
	private String senderCity;
	private String senderAddress;
	private String senderZipcode;
	
	private String receiverCountry;
	private String receiverCity;
	private String receiverAddress;
	private String receiverZipcode;
	
	@Transient
	private List<ParcelEvent> events;

	public Parcel() {
	}
	
	public Parcel(long parcelId, String trackingNumber) {
		super();
		this.parcelId = parcelId;
		this.trackingNumber = trackingNumber;
	}
	
	public Parcel(long parcelId, String senderCity, String receiverCity) {
		super();
		this.parcelId = parcelId;
		this.senderCity = senderCity;
		this.receiverCity = receiverCity;
	}

	public long getParcelId() {
		return parcelId;
	}

	public void setParcelId(long parcelId) {
		this.parcelId = parcelId;
	}

	public String getTrackingNumber() {
		return trackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}

	
	public String getSenderCountry() {
		return senderCountry;
	}

	public void setSenderCountry(String senderCountry) {
		this.senderCountry = senderCountry;
	}

	public String getSenderCity() {
		return senderCity;
	}

	public void setSenderCity(String senderCity) {
		this.senderCity = senderCity;
	}

	public String getSenderAddress() {
		return senderAddress;
	}

	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}

	public String getSenderZipcode() {
		return senderZipcode;
	}

	public void setSenderZipcode(String senderZipcode) {
		this.senderZipcode = senderZipcode;
	}

	public String getReceiverCountry() {
		return receiverCountry;
	}

	public void setReceiverCountry(String receiverCountry) {
		this.receiverCountry = receiverCountry;
	}

	public String getReceiverCity() {
		return receiverCity;
	}

	public void setReceiverCity(String receiverCity) {
		this.receiverCity = receiverCity;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public String getReceiverZipcode() {
		return receiverZipcode;
	}

	public void setReceiverZipcode(String receiverZipcode) {
		this.receiverZipcode = receiverZipcode;
	}

	public List<ParcelEvent> getEvents() {
		return events;
	}

	public void setEvents(List<ParcelEvent> events) {
		this.events = events;
	}
	
	public String getSenderData(){
		return String.format("%s, %s, %s, %s", senderCountry, senderCity, senderAddress, senderZipcode);
	}
	
	public String getReceiverData(){
		return String.format("%s, %s, %s, %s", receiverCountry, receiverCity, receiverAddress, receiverZipcode);
	}
}
