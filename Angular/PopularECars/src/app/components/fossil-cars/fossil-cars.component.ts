import { Component, EventEmitter, Output } from '@angular/core';
import { CarApiService } from '../../services/car-api.service';
import { CarService } from '../../services/car.service';
import { Observable } from 'rxjs';
import { Car } from '../../interfaces/Car';
import { CommonModule } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';

import { EditDialogComponent } from './edit-dialog/edit-dialog.component';
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
  @Output() carUpdate: EventEmitter<null> = new EventEmitter<null>();

  oddColor = "rgb(229, 229, 229)";
  evenColor = "rgb(255, 255, 255)";

  constructor(private carService: CarService, private apiService: CarApiService, private dialog: MatDialog) {
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
  openDialog(car: Car) {
    let dialogRef = this.dialog.open(EditDialogComponent, {
      width: "50vh",
      data: {
        car: car
      },
    });

    dialogRef.afterClosed().subscribe((data => {
      if (data) { 
        this.apiService.DataEdit(data.old, data.new).subscribe(() => {
          next: {
            this.carUpdate.emit();
          }
        })
      }
    }))
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
