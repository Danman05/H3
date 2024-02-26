import { Component } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { NewFossilCarComponent } from './components/admin/new-fossil-car/new-fossil-car.component';
import { FossilCarsComponent } from './components/fossil-cars/fossil-cars.component';
import { CarService } from './services/car.service';
import { TokenService } from './services/token.service';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [FossilCarsComponent, NewFossilCarComponent, RouterOutlet, RouterLink, RouterLinkActive],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'PopularECars';
  constructor(private carService: CarService, public tokenService: TokenService) { }

  isLoggedIn!: boolean;
  carUpdate() {
    this.getNewData();
  }

  ngOnInit(): void {
    this.isLoggedIn = this.tokenService.validateToken();
    this.getNewData()
  }

  getNewData() {
    this.carService.NewData();
  }

  login() {
    this.tokenService.setToken();
    this.isLoggedIn = this.tokenService.validateToken();

  }
  logout() {
    this.tokenService.removeToken();
    this.isLoggedIn = this.tokenService.validateToken();

  }
}
