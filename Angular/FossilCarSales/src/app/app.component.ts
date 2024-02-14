import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FossilCarsComponent } from './components/fossil-cars/fossil-cars.component';
import { NewFossilCarComponent } from './components/new-fossil-car/new-fossil-car.component';
import { CarApiService } from './services/car-api.service';
import { CarService } from './services/car.service';
import { Car } from './interfaces/Car';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, FossilCarsComponent, NewFossilCarComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {
  title = 'FossilCarSales';
  constructor(private apiService: CarApiService, private carService: CarService) {}

  carUpdate() {
    this.getNewData();
    console.log("Recieved updates, requesting new data!");
  }

  ngOnInit(): void {
    this.getNewData()
  }
  
  getNewData() {
    this.apiService.DataGet().subscribe((cars: Car[] ) => {
      next: {
        this.carService.newCars(cars);
      }
    });
  }
}
