import { Routes } from '@angular/router';
import { AdminComponent } from './components/admin/admin.component';
import { ErrorPageComponent } from './components/error-page/error-page.component';
import { FossilCarsComponent } from './components/fossil-cars/fossil-cars.component';

const adminGuard = (): boolean => {
    return false
}

export const routes: Routes = [
    {
        path: 'admin',
        component: AdminComponent,
        canActivate: [adminGuard]
    },
    {
        path: '',
        component: FossilCarsComponent
    },
    {
        path: 'error',
        component: ErrorPageComponent
    },
    {
        path: '**',
        redirectTo: "error",
        pathMatch: "full"
    }
];
