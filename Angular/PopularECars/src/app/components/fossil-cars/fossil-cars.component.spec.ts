import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FossilCarsComponent } from './fossil-cars.component';

describe('FossilCarsComponent', () => {
  let component: FossilCarsComponent;
  let fixture: ComponentFixture<FossilCarsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FossilCarsComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FossilCarsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
