import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { VaultService } from './services/vault.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {
  title = 'GoSave';

  constructor(private vaultService: VaultService) {}
  ngOnInit(): void {
    this.vaultService.GetAll().subscribe(data => {
      console.log(data);
    })
  }
}
