import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AnimalRoutingModule } from './animal-routing.module';
import { AnimalListComponent } from './animal-list/animal-list.component';
import {ReactiveFormsModule} from '@angular/forms';
import {AnimalComponent} from './animal.component';
import {ShareModule} from '../share/share.module';


@NgModule({
  declarations: [AnimalComponent, AnimalListComponent],
  exports: [],
  imports: [
    CommonModule,
    AnimalRoutingModule,
    ReactiveFormsModule,
    ShareModule
  ]
})
export class AnimalModule { }
