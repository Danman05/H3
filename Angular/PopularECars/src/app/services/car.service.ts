import { Injectable } from '@angular/core';
import { Car } from '../interfaces/Car';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { CarApiService } from './car-api.service';

@Injectable({
  providedIn: 'root'
})
export class CarService {

  private cars: Array<Car> = [];
  private carSubject$: Subject<Car[]> = new BehaviorSubject<Car[]>(this.cars);
  cars$: Observable<Car[]> = this.carSubject$.asObservable();

  constructor(private apiService: CarApiService) {
   }

   // Sets a new collection of cars
   newCars(cars: Car[]): void{
    this.cars = cars;
    this.carSubject$.next(this.cars);
   }
  
   NewData() {
    this.apiService.DataGet().subscribe((cars: Car[]) => {
      next: {
        this.newCars(cars);    
      }
    });
  }
}
