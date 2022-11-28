import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs';
import {JwtHelperService} from '@auth0/angular-jwt';

const AUTH_API = environment.auth_api;
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  httpOptions: any;
  isLoggedIn: boolean;

  constructor(private http: HttpClient, private jwtHelperService: JwtHelperService) {
    this.httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      }),
      'Access-Control-Allow-Origin': 'http://localhost:4200',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,PATCH,OPTIONS'
    };
  }

  login(loginRequest): Observable<any> {
    return this.http.post(AUTH_API + '/login', {
      username: loginRequest.username,
      password: loginRequest.password
    }, this.httpOptions);
  }

  forgotPassword(email): Observable<any> {
    return this.http.get(AUTH_API + '/forgot-password?email=' + email, this.httpOptions);
  }

  resetPassword(resetPassRequest): Observable<any> {
    return this.http.post(AUTH_API + '/reset-password', {
      password: resetPassRequest.password,
      confirmPassword: resetPassRequest.confirmPassword,
      token: resetPassRequest.token
    }, this.httpOptions);
  }

  public isAuthenticated(): boolean {
    const token = sessionStorage.getItem('auth-token');
    return !this.jwtHelperService.isTokenExpired(token);
  }
}
