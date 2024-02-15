import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewFossilCarComponent } from './new-fossil-car.component';

describe('NewFossilCarComponent', () => {
  let component: NewFossilCarComponent;
  let fixture: ComponentFixture<NewFossilCarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NewFossilCarComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NewFossilCarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
