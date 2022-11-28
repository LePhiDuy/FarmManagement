package vn.codegym.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.codegym.backend.model.Animal;

@Repository
public interface AnimalRepository extends JpaRepository<Animal, Long> {
//    @Override
//    @Query (value = "select a.* from animal a",
//            countQuery = "select a.* from animal",
//            nativeQuery = true)
//    Page<Animal> findAll(Pageable pageable);

    @Override
    @Modifying
    @Query(value = "delete from animal a where a.id = ?1",
            nativeQuery = true)
    void deleteById(Long id);

//    @Override
//    @Query (value = "select a.* from animal a where a.id = ?1",
//            countQuery = "select a.* from animal a where a.id=?1",
//            nativeQuery = true)
//    Optional<Animal> findById(Long id);
}
