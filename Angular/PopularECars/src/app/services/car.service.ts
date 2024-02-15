import { Injectable } from '@angular/core';
import { Car } from '../interfaces/Car';
import { BehaviorSubject, Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CarService {

  private cars: Array<Car> = [];
  private carSubject$: Subject<Car[]> = new BehaviorSubject<Car[]>(this.cars);
  cars$: Observable<Car[]> = this.carSubject$.asObservable();

  constructor() {
   }

   // Sets a new collection of cars
   newCars(cars: Car[]): void{
    this.cars = cars;
    this.carSubject$.next(this.cars);
   }
  //  newCar(car: Car): void {
  //   this.cars.push(car);
  //   this.carSubject$.next(this.cars);
  //  }
}
