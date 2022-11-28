package vn.codegym.backend.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface AnimalService<T, Long> {
    Page<T> findAll(Pageable pageable);

    void deleteById(Long id);

    Optional<T> findById(Long id);

    void save(T t);

    void update(Long id, T t);
}
