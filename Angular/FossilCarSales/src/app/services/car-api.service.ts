import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Car } from '../interfaces/Car';

@Injectable({
  providedIn: 'root'
})
export class CarApiService {

  port: string = "5162";

  apiString: string = `http://localhost:${this.port}/car`;

  constructor(private httpClient: HttpClient) { }

  public DataGet() : Observable<Car[]>{
    return this.httpClient.get<Car[]>(this.apiString);
  }
  public DataNew(car: Car) : Observable<Car[]>{
    return this.httpClient.post<Car[]>(this.apiString, car);
  }
  public DataDelete(car: Car) : Observable<Car>{
    return this.httpClient.delete<Car>(`${this.apiString}/${car.rank}`);
  }
  public DataReset() {
    return this.httpClient.get(`${this.apiString}/reset`);
  }
}
