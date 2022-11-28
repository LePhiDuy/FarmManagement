import { Injectable } from '@angular/core';
import {AuthService} from './auth.service';
import {ActivatedRouteSnapshot, Router} from '@angular/router';
import {TokenStorageService} from '../token-storage.service';
import {ShareService} from '../share.service';
import {ToastrService} from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class RoleGuardService {

  constructor(private auth: AuthService,
              private router: Router,
              private tokenStorageService: TokenStorageService,
              private shareService: ShareService,
              private toastrService: ToastrService) {}
  canActivate(route: ActivatedRouteSnapshot): boolean {
    const expectedRole = route.data.expectedRole;
    const role = this.tokenStorageService.getUser().roles[0].name;
    if (!this.auth.isAuthenticated() || role !== expectedRole) {
      this.toastrService.error('Bạn không có quyền truy cập đường dẫn này!', 'Thông báo', {
        timeOut: 2000,
        extendedTimeOut: 1500,
        progressBar: true
      });
      this.router.navigateByUrl('');
      return false;
    }
    return true;
  }
}
