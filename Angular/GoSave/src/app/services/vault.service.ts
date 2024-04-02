import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../../environment';

@Injectable({
  providedIn: 'root'
})
export class VaultService {


  constructor(private httpClient: HttpClient) { }

  GetAll(): Observable<any> {
    console.log(`Getting ${environment.apiUrl}`);
    return this.httpClient.get(`${environment.apiUrl}/Vault/All`);
  }
}
