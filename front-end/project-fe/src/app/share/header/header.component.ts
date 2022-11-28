import {Component, OnChanges, OnInit} from '@angular/core';
import {TokenStorageService} from '../../service/token-storage.service';
import {ShareService} from '../../service/share.service';
import {Router} from '@angular/router';
import {ToastrService} from 'ngx-toastr';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  isLoggedIn = false;
  username: string;
  role: string;
  visible = true;

  constructor(private tokenStorageService: TokenStorageService,
              private shareService: ShareService,
              private router: Router,
              private toastrService: ToastrService) {
    this.shareService.getClickEvent().subscribe(() => {
      this.loadHeader();
    });
  }

  loadHeader(): void {
    if (this.tokenStorageService.getToken()) {
      this.username = this.tokenStorageService.getUser().username;
      this.role = this.tokenStorageService.getUser().roles[0].name;
      this.isLoggedIn = true;
    } else {
      this.isLoggedIn = false;
    }
  }

  ngOnInit(): void {
    this.loadHeader();
  }
  logOut() {
    this.tokenStorageService.logOut();
    this.ngOnInit();
    this.toastrService.success('Đăng xuất thành công', 'Thông báo', {
      timeOut: 2000,
      extendedTimeOut: 1500,
      progressBar: true
    });
    this.router.navigateByUrl('');
  }

  toggleCollapse() {
    this.visible = !this.visible;
  }

  HideCollapse() {
    this.visible = true;
  }
}
