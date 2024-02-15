import { Component, EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { Observable } from 'rxjs';
import { Car } from '../../../interfaces/Car';
import { CarApiService } from '../../../services/car-api.service';
import { CarService } from '../../../services/car.service';
import { EditDialogComponent } from './edit-dialog/edit-dialog.component';

@Component({
  selector: 'app-fossil-car-admin',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './fossil-car-admin.component.html',
  styleUrl: './fossil-car-admin.component.css'
})
export class FossilCarAdminComponent {

  cars$: Observable<Car[]> | undefined

  // Event Emitter
  @Output() carUpdate: EventEmitter<string> = new EventEmitter<string>();

  oddColor = "rgb(229, 229, 229)";
  evenColor = "rgb(255, 255, 255)";

  constructor(private carService: CarService, private apiService: CarApiService, private dialog: MatDialog) {
    this.cars$ = this.carService.cars$;
  }

  // delete a car
  CarDelete(car: Car) {
    this.apiService.DataDelete(car).subscribe(() => {
      next: {
        this.carService.NewData();
        this.carUpdate.emit("Car has been deleted!");
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
            this.carService.NewData();
            this.carUpdate.emit("Changes has been saved!");
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
        this.carService.NewData();
        this.carUpdate.emit("Data has been reset!");
      }
    })
  }
}
