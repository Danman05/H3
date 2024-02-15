import { Component } from '@angular/core';
import { CarService } from '../../services/car.service';
import { Observable } from 'rxjs';
import { Car } from '../../interfaces/Car';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-fossil-cars',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './fossil-cars.component.html',
  styleUrl: './fossil-cars.component.css'
})
export class FossilCarsComponent {

  cars$: Observable<Car[]> | undefined

 

  oddColor = "rgb(229, 229, 229)";
  evenColor = "rgb(255, 255, 255)";

  constructor(private carService: CarService) {
    this.cars$ = this.carService.cars$;
  }
}
