package hu.bme.aut.erlabor.parceltracker;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class ParcelEvent implements Serializable{
	
	private static final long serialVersionUID = 7850254273338644536L;

	public enum Status {
		POSTED, IN_TRANSIT, DELIVERED, TURNED_BACK, BACK_AT_SENDER
	}

	@Id
	private long eventId;
	
	private long parcelId;
	
	private Status status;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateTime;
	
	public ParcelEvent() {
	}
	
	public ParcelEvent(long eventId, long parcelId, Status status, Date dateTime) {
		super();
		this.eventId = eventId;
		this.parcelId = parcelId;
		this.status = status;
		this.dateTime = dateTime;
	}

	public long getEventId() {
		return eventId;
	}

	public void setEventId(long eventId) {
		this.eventId = eventId;
	}

	public long getParcelId() {
		return parcelId;
	}

	public void setParcelId(long parcelId) {
		this.parcelId = parcelId;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
}
