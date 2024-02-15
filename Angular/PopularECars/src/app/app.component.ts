import { Component } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { NewFossilCarComponent } from './components/admin/new-fossil-car/new-fossil-car.component';
import { FossilCarsComponent } from './components/fossil-cars/fossil-cars.component';
import { CarService } from './services/car.service';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [FossilCarsComponent, NewFossilCarComponent, RouterOutlet, RouterLink, RouterLinkActive],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'PopularECars';
  constructor(private carService: CarService) { }

  carUpdate() {
    this.getNewData();
  }

  ngOnInit(): void {
    this.getNewData()
  }

  getNewData() {
    this.carService.NewData();
  }
}
