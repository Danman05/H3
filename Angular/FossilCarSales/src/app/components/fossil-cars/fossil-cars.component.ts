import { Component, EventEmitter, Output } from '@angular/core';
import { CarApiService } from '../../services/car-api.service';
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

 // Event Emitter
  @Output() carUpdate: EventEmitter<null>= new EventEmitter<null>();

  oddColor = "rgb(229, 229, 229)";
  evenColor = "rgb(255, 255, 255)";

  constructor(private carService: CarService, private apiService: CarApiService) {
    this.cars$ = this.carService.cars$;
  }

  // delete a car
  CarDelete(car: Car) {
    this.apiService.DataDelete(car).subscribe(() => {
      next: {
        this.carUpdate.emit(); // emit update
      }
    })
  }
  CarEdit(car: Car) {
    // Not implemented
  }

  // Reset car data
  CarReset() {
    this.apiService.DataReset().subscribe(() => {
      next: {
        this.carUpdate.emit(); // emit update
      }
    })
  }
}
