import { Injectable, inject } from '@angular/core';
import { CanActivateFn } from '@angular/router';
import { TokenService } from './token.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService {

  constructor(private tokenService: TokenService) { }

  canActivate() {
    return this.tokenService.validateToken();
  }
}
export const authGuard: CanActivateFn = (route, state) => {
  return inject(AuthGuardService).canActivate();
}
