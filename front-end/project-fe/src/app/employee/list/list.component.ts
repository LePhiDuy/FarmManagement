import { Component, OnInit } from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {EmployeeService} from '../../service/employee.service';
import {Employee} from '../../model/employee';
import {TokenStorageService} from '../../service/token-storage.service';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {
  id: number;
  name: string;
  indexPagination = 0;
  public value = '';
  employees: any;
  employeeFind: Employee;

  constructor(private employeeService: EmployeeService,
              private toastr: ToastrService,
              private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    this.getAll(this.indexPagination);
  }

  getAll(indexPagination) {
    this.employeeService.getAll(indexPagination).subscribe(
      data => {
        this.employees = data;
        console.log(data);
      }
    );
  }
  changeId(id: number, name: string) {
    this.id = id;
    this.name = name;
  }

  delete(id: number) {
    this.employeeService.delete(id).subscribe(() => {
      this.toastr.success('Xóa nhân viên thành công.', 'Thông báo');
      if (this.employees.numberOfElemenents === 1) {
        this.indexPagination = this.indexPagination - 1;
      }
      this.getAll(this.indexPagination);
    }, error => {
      this.toastr.error('Xóa nhân viên thất bại.', 'Thông báo' );
    });
  }
  firstPage() {
    this.indexPagination = 0;
    this.ngOnInit();
  }

  nextPage() {
    this.indexPagination = this.indexPagination + 1;
    if (this.indexPagination >= this.employees.totalPages) {
      this.indexPagination = this.indexPagination - 1;
      this.ngOnInit();
    }
    this.employeeService.getAll(this.indexPagination).subscribe(data => {
      this.employees = data;
    });
  }

  nextTwoPage() {
    this.indexPagination = this.indexPagination + 2;
    if (this.indexPagination >= this.employees.totalPages) {
      this.indexPagination = this.indexPagination - 2;
      this.ngOnInit();
    }
    this.employeeService.getAll(this.indexPagination).subscribe(data => {
      this.employees = data;
    });
  }


  previousPage() {
    this.indexPagination = this.indexPagination - 1;
    if (this.indexPagination < 0) {
      this.indexPagination = 0;
      this.ngOnInit();
    } else {
      this.employeeService.getAll(this.indexPagination).subscribe(data => {
        this.employees = data;
      });
    }
  }

  previousTwoPage() {
    this.indexPagination = this.indexPagination - 2;
    if (this.indexPagination < 0) {
      this.indexPagination = 0;
      this.ngOnInit();
    } else {
      this.employeeService.getAll(this.indexPagination).subscribe(data => {
        this.employees = data;
      });
    }
  }
  lastPage() {
    this.indexPagination = this.employees.totalPages - 1;
    this.employeeService.getAll(this.indexPagination).subscribe(data => {
      this.employees = data;
    });
  }
}
