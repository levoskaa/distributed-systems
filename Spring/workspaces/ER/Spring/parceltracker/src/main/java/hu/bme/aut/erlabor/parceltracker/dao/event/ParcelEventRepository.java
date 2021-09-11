package hu.bme.aut.erlabor.parceltracker.dao.event;

import java.util.List;

import hu.bme.aut.erlabor.parceltracker.ParcelEvent;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParcelEventRepository extends JpaRepository<ParcelEvent, Long>{

	List<ParcelEvent> findByParcelIdInOrderByDateTime(List<Long> parcelIds);
}
