import {Component, OnInit} from '@angular/core';
import {Slick} from 'ngx-slickjs';
import {NewsService} from '../../service/news/news.service';
import {ActivatedRoute, Router} from '@angular/router';
import {News} from '../../model/news/news';

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.css']
})
export class HomepageComponent implements OnInit {
  config: Slick.Config = {
    dots: false,
    infinite: true,
    speed: 1000,
    autoplay: true,
    autoplaySpeed: 800,
    slidesToShow: 3,
    slidesToScroll: 2,
    arrows: true,
    prevArrow: '<button type=\'button\' class=\'prevArrow\'><i class=\'ti-arrow-left\'></i></button>',
    nextArrow: '<button type=\'button\' class=\'nextArrow\'><i class=\'ti-arrow-right\'></i></button>',
    responsive: [{
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1
      }
    },
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 767,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  };

  newsList: News[];

  constructor(private newsService: NewsService, private route: Router, private activateRoute: ActivatedRoute) {
    this.getAll();
  }

  ngOnInit(): void {
    this.getAll();
  }

  private getAll() {
    return this.newsService.getAll().subscribe(news => {
      this.newsList = news;
    }, error => {
      console.log(error);
    });
  }
}
