import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HTTP_INTERCEPTORS, HttpHeaders
} from '@angular/common/http';
import { Observable } from 'rxjs';
import {TokenStorageService} from '../service/token-storage.service';


@Injectable()
export class JwtInterceptor implements HttpInterceptor {

  constructor(private tokenService: TokenStorageService) {}

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    let authReq = request;
    const token = this.tokenService.getToken();
    if (token != null) {
      authReq = request.clone({ headers: request.headers.set('Authorization', 'Bearer ' + token) });
    }
    console.log(authReq);
    return next.handle(authReq);
  }
}

