import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {ListComponent} from './list/list.component';
import {RoleGuardService as RoleGuard} from '../service/auth/role-guard.service';
import {AuthGuardService as AuthGuard} from '../service/auth/auth-guard.service';
import {EmployeeComponent} from './employee.component';

const routes: Routes = [
  {
    path: 'employee', component: EmployeeComponent, children: [
      {
        path: 'list',
        component: ListComponent
      }
    ],
    canActivate: [AuthGuard, RoleGuard],
    data: {
      expectedRole: 'ROLE_ADMIN'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeRoutingModule {
}
