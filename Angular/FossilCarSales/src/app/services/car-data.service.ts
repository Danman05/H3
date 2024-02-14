import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Car } from '../interfaces/Car';

@Injectable({
  providedIn: 'root'
})
export class CarDataService {

  apiString: string = 'http://localhost:5162/car';
  constructor(private httpClient: HttpClient) { }

  public getData() : Observable<Car[]>{
    return this.httpClient.get<Car[]>(this.apiString);
  }
}
