import { Component } from '@angular/core';
import { NewFossilCarComponent } from './new-fossil-car/new-fossil-car.component';
import { FossilCarAdminComponent } from './fossil-car-admin/fossil-car-admin.component';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { MatSnackBar, MatSnackBarModule} from '@angular/material/snack-bar'
@Component({
  selector: 'app-admin',
  standalone: true,
  imports: [FossilCarAdminComponent, NewFossilCarComponent, MatSnackBarModule, RouterOutlet, RouterLink, RouterLinkActive],
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css'
})
export class AdminComponent {

  

  constructor(private snackBar: MatSnackBar) {}


  carUpdate(message: string) : void {
    this.snackBar.open(message, "", {duration: 2000});
  }
}
