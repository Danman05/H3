import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class VaultService {

  
  constructor(private httpClient: HttpClient) { }

  GetAll(): Observable<any> {
    return this.httpClient.get("");
  }
}
