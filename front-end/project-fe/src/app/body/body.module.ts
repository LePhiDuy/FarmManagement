import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';

import {BodyRoutingModule} from './body-routing.module';
import {HomepageComponent} from './homepage/homepage.component';
import {NgxSlickJsModule} from 'ngx-slickjs';
import {NewsdetailComponent} from './newsdetail/newsdetail.component';
import {BodyComponent} from './body.component';
import {ShareModule} from '../share/share.module';

@NgModule({
  declarations: [
    BodyComponent,
    HomepageComponent,
    NewsdetailComponent,
  ],
  exports: [],
  imports: [
    CommonModule,
    BodyRoutingModule,
    NgxSlickJsModule,
    ShareModule,
  ]
})
export class BodyModule {
}
