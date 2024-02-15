import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FossilCarsComponent } from './components/fossil-cars/fossil-cars.component';
import { NewFossilCarComponent } from './components/new-fossil-car/new-fossil-car.component';
import { CarApiService } from './services/car-api.service';
import { CarService } from './services/car.service';
import { Car } from './interfaces/Car';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, FossilCarsComponent, NewFossilCarComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {
  title = 'FossilCarSales';
  constructor(private apiService: CarApiService, private carService: CarService, private snackBar: MatSnackBar) { }

  carUpdate() {
    this.getNewData(true);
  }

  ngOnInit(): void {
    this.getNewData(false)
  }

  getNewData(showSnackBar: boolean) {
    this.apiService.DataGet().subscribe((cars: Car[]) => {
      next: {
        this.carService.newCars(cars);
        if (showSnackBar)
          this.snackBar.open("Data has been updated", "", { duration: 2000 });
      }
    });
  }
}
