package net.diana.taxi.repository;

import net.diana.taxi.model.TravelBook;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface TravelBookRepository extends JpaRepository<TravelBook, Integer>
{
    List<TravelBook> findTravelBookByTravelId(@Param("travelId") int travelId);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE travel_books t SET t.is_rejected = :is_rejected where t.id = :id", nativeQuery = true)
    public int updateTravelBook(@Param("id") int id, @Param("is_rejected") boolean is_rejected);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE travel_books t SET t.is_approved = true where t.id = :id", nativeQuery = true)
    int updateTravelBookApproved(@Param("id") int id);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE travel_books t SET t.is_rejected = true where t.id = :id", nativeQuery = true)
    int updateTravelBookRejected(@Param("id") int id);

    List<TravelBook> findTravelBookListByUserId(@Param("userId") int userId);
}
