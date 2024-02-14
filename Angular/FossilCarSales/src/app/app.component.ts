import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FossilCarsComponent } from './components/fossil-cars/fossil-cars.component';
import { NewFossilCarComponent } from './components/new-fossil-car/new-fossil-car.component';
import { Car } from './interfaces/Car';
import { CarDataService } from './services/car-data.service';
import { HttpClientModule } from '@angular/common/http';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, FossilCarsComponent, NewFossilCarComponent, HttpClientModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {
  title = 'FossilCarSales';

  constructor (private carService: CarDataService) {}
  carData: Car[] = [];

  ngOnInit(): void {
    this.carService.getData().subscribe((data => {
      console.log(data);
    }))
  }

  
}
