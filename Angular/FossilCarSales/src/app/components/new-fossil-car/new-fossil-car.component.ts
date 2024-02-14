import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';

@Component({
  selector: 'app-new-fossil-car',
  standalone: true,
  imports: [MatSelectModule, MatInputModule, MatFormFieldModule, ReactiveFormsModule, FormsModule, ReactiveFormsModule, CommonModule],
  templateUrl: './new-fossil-car.component.html',
  styleUrl: './new-fossil-car.component.css'
})
export class NewFossilCarComponent implements OnInit {

  carFormData!: FormGroup


  ngOnInit(): void {
    this.carFormData = new FormGroup({
      rank: new FormControl('',
        Validators.required
        ),
      model: new FormControl('',
      Validators.required
      ),
      quantity: new FormControl('',
      Validators.required
      ),
      changeQuantityPercent: new FormControl('',
      Validators.required)
    })
  }

  onCarSubmit(): void {
    if (this.carFormData.valid) {
      
    }
  }
}
