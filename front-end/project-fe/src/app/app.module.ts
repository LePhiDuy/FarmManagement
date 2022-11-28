import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {APP_BASE_HREF} from '@angular/common';
import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {BodyModule} from './body/body.module';
import {NgxSlickJsModule} from 'ngx-slickjs';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import {LogosliderComponent} from './share/logoslider/logoslider.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {ToastrModule} from 'ngx-toastr';
import {SecurityModule} from './security/security.module';
import {JwtInterceptor} from './helpers/jwt-interceptor';
import {AnimalModule} from './animal/animal.module';
import {EmployeeModule} from './employee/employee.module';
import {ShareModule} from './share/share.module';
import {JWT_OPTIONS, JwtHelperService} from "@auth0/angular-jwt";


@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BodyModule,
    SecurityModule,
    AnimalModule,
    EmployeeModule,
    ShareModule,
    NgxSlickJsModule.forRoot({
      links: {
        jquery: 'https://code.jquery.com/jquery-3.4.0.min.js',
        slickJs: 'https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js',
        slickCss: 'https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css',
        slickThemeCss: 'https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css'
      }
    }),
    BrowserAnimationsModule,
    ToastrModule.forRoot()
  ],
  providers: [
    {provide: APP_BASE_HREF, useValue: '/'},
    {
      provide: HTTP_INTERCEPTORS,
      useClass: JwtInterceptor,
      multi: true
    },
    { provide: JWT_OPTIONS, useValue: JWT_OPTIONS },
    JwtHelperService
  ],
  exports: [
    LogosliderComponent,
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
}
