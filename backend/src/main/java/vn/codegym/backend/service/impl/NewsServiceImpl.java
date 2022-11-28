package vn.codegym.backend.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.codegym.backend.model.News;
import vn.codegym.backend.repository.NewsRepository;
import vn.codegym.backend.service.INewsService;

import java.util.List;
import java.util.Optional;

@Service
public class NewsServiceImpl implements INewsService<News> {
    @Autowired
    private NewsRepository newsRepository;

    @Override
    public List<News> findAll() {
        return newsRepository.findAll();
    }

    @Override
    public Optional<News> findById(Long id) {
        return newsRepository.findById(id);
    }

    @Override
    public void save(News news) {
        newsRepository.saveNews(news.getAuthor(),
                                news.getContent(),
                                news.getDateCreate(),
                                news.getFirstSentence(),
                                news.getSource_url(),
                                news.getTitle()
                                );
    }

    @Override
    public void delete(Long id) {
        newsRepository.deleteById(id);
    }

    @Override
    public void update(Long id, News news) {

        newsRepository.update(news.getAuthor(),news.getContent(),news.getDateCreate(),news.getFirstSentence(),news.getSource_url(),news.getTitle(),id);
    }
}
