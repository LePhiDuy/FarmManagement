package vn.codegym.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import vn.codegym.backend.model.News;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {
    @Override
    @Query(value = "select n.* from news n", countQuery = "select n.* from news", nativeQuery = true)
    List<News> findAll();

    @Override
    @Query(value = "select n.* from news n\n" +
            " where n.id=?1", countQuery = "select n.* from news n where n.id=?1", nativeQuery = true)
    Optional<News> findById(Long id);

    @Override
    @Modifying
    @Query(value = "delete from news n\n" +
            " where n.id=?1", nativeQuery = true)
    void deleteById(Long id);

    @Transactional
    @Modifying
    @Query(value = "insert into news (`author`, `content`, `date_create`, `first_sentence`, `source_url`, `title`) " +
            "VALUES (?,?,?,?,?,?);", nativeQuery = true)
    void saveNews(String author, String content, Date dateCreate, String firstSentence, String source_url, String title);


    @Transactional
    @Modifying
    @Query(value = "update news set `author`=?, `content`=?, `date_create`=?, `first_sentence`=?, `source_url`=?, `title`=? where `id`=?",nativeQuery = true)
    void update(String author, String content, Date dateCreate, String firstSentence, String source_url, String title, Long id);
}

