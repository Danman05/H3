import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class TokenService {

  constructor() { }

  setToken(): void {
    localStorage.setItem("token", "this is your token");
  }

  removeToken(): void {
    localStorage.removeItem("token");
  }
  validateToken(): boolean
  {
    if (localStorage.getItem('token')) {
      return true
    }
    else {
      return false
    }
  }
}
