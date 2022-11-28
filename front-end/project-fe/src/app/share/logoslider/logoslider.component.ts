import { Component, OnInit } from '@angular/core';
import {Slick} from 'ngx-slickjs';

@Component({
  selector: 'app-logoslider',
  templateUrl: './logoslider.component.html',
  styleUrls: ['./logoslider.component.css']
})
export class LogosliderComponent implements OnInit {
  config: Slick.Config = {
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    autoplay: true,
    dots: false,
    arrows: false,
    responsive: [{
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1
      }
    },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 400,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  };

  constructor() { }

  ngOnInit(): void {
  }

}
