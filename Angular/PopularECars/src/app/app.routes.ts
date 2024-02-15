import { Routes } from '@angular/router';
import { FossilCarsComponent } from './components/fossil-cars/fossil-cars.component';
import { NewFossilCarComponent } from './components/new-fossil-car/new-fossil-car.component';
import { ErrorPageComponent } from './components/error-page/error-page.component';

export const routes: Routes = [
    { path: '', component: FossilCarsComponent },
    { path: 'admin', component: NewFossilCarComponent},
    { path: '**', component: ErrorPageComponent}
];
