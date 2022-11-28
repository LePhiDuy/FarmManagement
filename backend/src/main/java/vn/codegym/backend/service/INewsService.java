package vn.codegym.backend.service;


import vn.codegym.backend.model.News;

import java.util.List;
import java.util.Optional;

public interface INewsService<T> {
    List<T> findAll();
    Optional<T> findById(Long id);
    void save(News news);
    void delete(Long id);

    void update(Long id, News news);
}
