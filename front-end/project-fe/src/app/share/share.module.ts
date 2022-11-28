import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ShareRoutingModule } from './share-routing.module';
import { ShareComponent } from './share.component';
import {FooterComponent} from "./footer/footer.component";
import {HeaderComponent} from "./header/header.component";
import {LogosliderComponent} from "./logoslider/logoslider.component";
import {FocusInvalidInputDirective} from "../helpers/focus-invalid-input.directive";
import {NgxSlickJsModule} from "ngx-slickjs";


@NgModule({
  declarations: [ShareComponent, FooterComponent, HeaderComponent, LogosliderComponent, FocusInvalidInputDirective],
  exports: [
    HeaderComponent,
    LogosliderComponent,
    FooterComponent,
    ShareComponent,
    FocusInvalidInputDirective
  ],
    imports: [
        CommonModule,
        ShareRoutingModule,
        NgxSlickJsModule
    ]
})
export class ShareModule { }
