import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogTitle, MatDialogContent, MatDialogRef } from '@angular/material/dialog';
import { Car } from '../../../../interfaces/Car';

import { FormsModule, ReactiveFormsModule, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
@Component({
  selector: 'app-edit-dialog',
  standalone: true,
  imports: [MatDialogTitle, MatDialogContent, MatFormFieldModule, MatInputModule, ReactiveFormsModule, FormsModule, ReactiveFormsModule],
  templateUrl: './edit-dialog.component.html',
  styleUrl: './edit-dialog.component.css'
})
export class EditDialogComponent implements OnInit {

  constructor(@Inject(MAT_DIALOG_DATA) public data: { car: Car }, public dialogRef: MatDialogRef<EditDialogComponent>)  { }
  carFormData!: FormGroup
  ngOnInit(): void {

    // Form setup
    this.carFormData = new FormGroup({
      rank: new FormControl(this.data.car.rank,
        Validators.required
      ),
      model: new FormControl(this.data.car.model,
        Validators.required
      ),
      quantity: new FormControl(this.data.car.quantity,
        Validators.required
      ),
      changeQuantityPercent: new FormControl(this.data.car.changeQuantityPercent,
        Validators.required)
    })
  }

  saveChanges(): void {
    this.dialogRef.close({old: this.data.car, new: this.carFormData.value});
  }

  closeDialog(): void {
    this.dialogRef.close();
  }
}

