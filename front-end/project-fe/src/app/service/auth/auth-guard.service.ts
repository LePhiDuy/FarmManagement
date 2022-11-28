import { Injectable } from '@angular/core';
import {AuthService} from './auth.service';
import {Router} from '@angular/router';
import {TokenStorageService} from '../token-storage.service';
import {ShareService} from '../share.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService {

  constructor(private auth: AuthService,
              private router: Router,
              private tokenStorageService: TokenStorageService,
              private shareService: ShareService) {}
  canActivate(): boolean {
    if (!this.auth.isAuthenticated()) {
      this.shareService.sendClickEvent();
      this.tokenStorageService.logOut();
      this.router.navigateByUrl('/authen/login');
      return false;
    }
    return true;
  }
}
