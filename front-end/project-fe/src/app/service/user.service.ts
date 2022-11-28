import { Injectable } from '@angular/core';
import {environment} from "../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

const USER_API = environment.user_api;
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getUserFromToken(token: string): Observable<any> {
    return this.http.get<any>(USER_API + "/getUserFromToken?token=" + token);
  }
}
