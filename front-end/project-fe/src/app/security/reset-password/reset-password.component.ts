import {Component, ElementRef, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../service/auth/auth.service";
import {ActivatedRoute, Router} from "@angular/router";
import {ResetPassRequest} from "../../model/reset-pass-request";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.css']
})
export class ResetPasswordComponent implements OnInit {
  formResetPass: FormGroup;

  constructor(private formBuilder: FormBuilder,
              private authService: AuthService,
              private activateRoute: ActivatedRoute,
              private toastrService: ToastrService,
              private router: Router) {
  }

  ngOnInit(): void {
    this.formResetPass = this.formBuilder.group({
      password: ['', [Validators.required]],
      confirmPassword: ['', [Validators.required]],

    }, {validators: this.ConfirmedValidator('password', 'confirmPassword')});
  }

  get password() {
    return this.formResetPass.get('password');
  }

  get confirmPassword() {
    return this.formResetPass.get('confirmPassword');
  }

  ConfirmedValidator(controlName: string, matchingControlName: string) {
    return (formGroup: FormGroup) => {
      const control = formGroup.controls[controlName];
      const matchingControl = formGroup.controls[matchingControlName];

      if (matchingControl.errors && !matchingControl.errors.confirmedValidator) {
        return;
      }

      if (control.value !== matchingControl.value) {
        matchingControl.setErrors({ confirmedValidator: true });
      } else {
        matchingControl.setErrors(null);
      }
    };
  }

  onSubmit() {
    if (this.formResetPass.valid) {
      const token = this.activateRoute.snapshot.paramMap.get('token');
      const resetPassRequest: ResetPassRequest = {
        password: this.password.value,
        confirmPassword: this.confirmPassword.value,
        token: token
      }

      this.authService.resetPassword(resetPassRequest).subscribe(
        data => {
          this.toastrService.success(data.message, 'Thông báo', {
            timeOut: 2000,
            extendedTimeOut: 1500,
            progressBar: true
          });
          this.router.navigateByUrl('authen/login');
        },
        error => {
          this.toastrService.warning(error.error.message, 'Thông báo', {
            timeOut: 2000,
            extendedTimeOut: 1500,
            progressBar: true
          });
        });
    }
  }
}
