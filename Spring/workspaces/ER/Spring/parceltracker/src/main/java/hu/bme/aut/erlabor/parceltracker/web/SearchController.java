package hu.bme.aut.erlabor.parceltracker.web;

import hu.bme.aut.erlabor.parceltracker.Parcel;
import hu.bme.aut.erlabor.parceltracker.service.TrackerService;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {

	@Autowired
	TrackerService trackerService;
	
	@RequestMapping("/basicsearch")
	public String basicSearch(@RequestParam("trackingNo") String trackingNumber, Map<String, Object> model){
	
		Parcel parcel = trackerService.basicSearch(trackingNumber);
		
		if(parcel != null)
			model.put("results", Arrays.asList(parcel));
		
		return "search";
	}
	
	@RequestMapping("/citysearch")
	public String citySearch(
			@RequestParam("senderCity") String senderCity, 
			@RequestParam("receiverCity") String receiverCity, 
			Map<String, Object> model){

		List<Parcel> parcels = trackerService.citySearch(senderCity, receiverCity);
		model.put("results", parcels);
		
		return "search";
	}
	
	@RequestMapping("/")
	public String init(){
		return "search";
	}
	
}
