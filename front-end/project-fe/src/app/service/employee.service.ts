import { Injectable } from '@angular/core';
import {environment} from '../../environments/environment';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Employee} from '../model/employee';


const API_URL = `${environment.apiEmployee}`;
@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  constructor(private http: HttpClient) {
  }
  getAll(page): Observable<any[]> {
    return this.http.get<any[]>(API_URL + '?page=' + page);
  }
  delete(id: number): Observable<Employee> {
    return this.http.delete<Employee>(API_URL + '/' + id);
  }
  findById(id: number): Observable<Employee> {
    return this.http.get<Employee>(API_URL + '/' + id);
  }
}
