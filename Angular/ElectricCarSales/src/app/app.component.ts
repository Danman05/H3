import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ECarsData } from './interfaces/ECarsData';
import { CommonModule } from '@angular/common';
import { Observable } from 'rxjs';
import { CarDataService } from './services/CarData.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent{
  title = 'ElectricCarSales';

  oddColor = "rgb(229, 229, 229)";
  evenColor = "rgb(255, 255, 255)";

  tableCenter = `
    display: flex;
    justify-content: center;
    text-align: center;
  `;

  items$?: Observable<ECarsData[]>;

  constructor(public carDataService: CarDataService) { }

}
