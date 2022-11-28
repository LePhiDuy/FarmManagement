import {Injectable} from '@angular/core';
import {environment} from '../../../environments/environment';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {News} from '../../model/news/news';

const api_news = environment.api_news;

@Injectable({
  providedIn: 'root'
})
export class NewsService {

  constructor(private http: HttpClient) {
  }

  getAll(): Observable<News[]> {
    return this.http.get<News[]>(api_news);
  }

  findById(id: number): Observable<News> {
    return this.http.get<News>(`${api_news}/${id}`);
  }
  saveNews(news: News): Observable<News> {
    return this.http.post<News>(api_news, news);
  }

  updateProduct(id: number, news: News): Observable<News> {
    return this.http.put<News>(`${api_news}/${id}`, news);
  }

  deleteProduct(id: number): Observable<News> {
    return this.http.delete<News>(`${api_news}/${id}`);
  }
}
