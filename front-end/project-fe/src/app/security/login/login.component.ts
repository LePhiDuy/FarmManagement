import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AuthService} from '../../service/auth/auth.service';
import {TokenStorageService} from '../../service/token-storage.service';
import {Router} from '@angular/router';
// @ts-ignore
import {ToastrService} from 'ngx-toastr';
import {UserService} from '../../service/user.service';
import {ShareService} from '../../service/share.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  formLogin: FormGroup;
  roles: string[] = [];
  formResetPass: FormGroup;

  @ViewChild('modalForgot') modalForgotPass;
  @ViewChild('closBtn') closBtn;

  constructor(private formBuilder: FormBuilder,
              private el: ElementRef,
              private authService: AuthService,
              private tokenStorageService: TokenStorageService,
              private router: Router,
              private toastrService: ToastrService,
              private userService: UserService,
              private shareService: ShareService) {
  }

  ngOnInit(): void {
    this.formLogin = this.formBuilder.group({
        username: ['', [Validators.required, Validators.pattern('^[a-zA-Z0-9]*$')]],
        password: ['', Validators.required],
        rememberMe: []
      }
    );
    this.formResetPass = this.formBuilder.group({
      email: ['', [Validators.email, Validators.required]]
    });
  }

  login(): void {
    if (this.formLogin.valid) {
      this.authService.login(this.formLogin.value).subscribe(
        data => {
          this.tokenStorageService.saveTokenSession(data.accessToken);
          this.userService.getUserFromToken(data.accessToken).subscribe(
            data => {
              this.tokenStorageService.saveUserSession(data);
              this.authService.isLoggedIn = true;
              this.formLogin.reset();
              this.shareService.sendClickEvent();
              this.toastrService.success('', 'Đăng nhập thành công: ', {
                timeOut: 2000,
                extendedTimeOut: 1500,
                progressBar: true
              });
              this.router.navigateByUrl('');
            }
          );
        },
        err => {
          this.authService.isLoggedIn = false;
          this.toastrService.error('Tên đăng nhập hoặc tài khoản không đúng', 'Đăng nhập thất bại: ', {
            timeOut: 2000,
            extendedTimeOut: 1500,
            progressBar: true
          });
        }
      );
    }
  }

  get username() {
    return this.formLogin.get('username');
  }

  get password() {
    return this.formLogin.get('password');
  }

  get email() {
    return this.formResetPass.get('email');
  }

  forgotPassword() {
    if (this.formResetPass.valid) {
      this.el.nativeElement.querySelector('.loading-container').style.display = 'block';
      this.authService.forgotPassword(this.formResetPass.get('email').value).subscribe(
        data => {
          this.el.nativeElement.querySelector('.loading-container').style.display = 'none';
          this.toastrService.success(data.message, 'Thông báo', {
            timeOut: 2000,
            extendedTimeOut: 1500,
            progressBar: true
          });
          this.closBtn.nativeElement.click();
        },
        error => {
          this.el.nativeElement.querySelector('.loading-container').style.display = 'none';
          this.toastrService.warning(error.error.message, 'Thông báo', {
            timeOut: 2000,
            extendedTimeOut: 1500,
            progressBar: true
          });
        }
      );
    }
  }

  onForgotPasswordClicked() {
    this.modalForgotPass.nativeElement.showModal();
  }
}
