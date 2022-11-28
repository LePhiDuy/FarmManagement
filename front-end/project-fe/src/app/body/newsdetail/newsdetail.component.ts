import {Component, OnInit} from '@angular/core';
import {NewsService} from '../../service/news/news.service';
import {ActivatedRoute, ParamMap, Router} from '@angular/router';
import {News} from '../../model/news/news';

@Component({
  selector: 'app-newsdetail',
  templateUrl: './newsdetail.component.html',
  styleUrls: ['./newsdetail.component.css']
})
export class NewsdetailComponent implements OnInit {
  news: News;
  id:number;

  constructor(private newsService: NewsService, private route: Router, private activateRoute: ActivatedRoute) {
    this.activateRoute.paramMap.subscribe((paramMap: ParamMap) => {
      this.id = +paramMap.get('id');
      this.getNews(this.id);
    });
  }

  ngOnInit(): void {
    this.activateRoute.paramMap.subscribe((paramMap:ParamMap)=>{
      this.id=+paramMap.get('id');
      this.getNews(this.id);
    })
  }

  private getNews(id: any) {
      return  this.newsService.findById(id).subscribe(news=>{
        this.news=news;
        console.log(this.news);
      },error => {console.log(error)});
  }
}
