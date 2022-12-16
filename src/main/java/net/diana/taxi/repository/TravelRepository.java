package net.diana.taxi.repository;

import net.diana.taxi.model.Travel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.sql.Date;
import java.util.List;

@Repository
public interface TravelRepository extends JpaRepository<Travel, Integer>
{
    //@Query(value = "SELECT * from travels t WHERE t.pickup = :pickup and t.destination = :destination" , nativeQuery = true)
    List<Travel> findTravelsByDestinationAndTravelDate(@Param("destination") String destination, @Param("date") Date date);


    List<Travel> findTravelsByTravelDate(@Param("date") Date date);

    List<Travel> findTravelByUserId(@Param("userId") int userId);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE travels t SET t.booked_seats = :bookedSeats  where t.id = :id", nativeQuery = true)
    int updateTravelBookedSeats(@Param("id") int id, @Param("bookedSeats") int bookedSeats);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE travels t SET t.is_canceled = true where t.id = :id", nativeQuery = true)
    int updateCanceledTravel(@Param("id") int id);
}