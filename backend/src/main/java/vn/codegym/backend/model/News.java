package vn.codegym.backend.model;

import javax.persistence.*;
import java.util.Date;

@Table(name = "news")
@Entity
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String title;
    @Column(columnDefinition = "TEXT",nullable = false)
    private String firstSentence;
    private String source_url;
    @Column(columnDefinition="LONGTEXT",nullable = false)
    private String content;
    private String author;
    @Column(columnDefinition = "date")
    private Date dateCreate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSource_url() {
        return source_url;
    }

    public void setSource_url(String source_url) {
        this.source_url = source_url;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getFirstSentence() {
        return firstSentence;
    }

    public void setFirstSentence(String firstSentence) {
        this.firstSentence = firstSentence;
    }
}
