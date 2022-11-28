import {Component, OnInit} from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AnimalService} from '../../service/animal.service';
import {Animal} from '../../model/animal';

@Component({
  selector: 'app-animal-list',
  templateUrl: './animal-list.component.html',
  styleUrls: ['./animal-list.component.css']
})
export class AnimalListComponent implements OnInit {
  indexPagination = 0;
  animal: any;
  animalCreate: Animal;
  animalEdit: Animal;
  id: number;
  deletes: number[] = [];
  formCreate: FormGroup;
  formEdit: FormGroup;
  constructor(private animalService: AnimalService, private toastr: ToastrService,
              private fb: FormBuilder) {
  }

  ngOnInit(): void {
    this.getAll(this.indexPagination);

    this.formCreate = this.fb.group({
        id: [],
        cageId: ['', [Validators.required]],
        isSick: ['', [Validators.required]],
        weight: ['', [Validators.required]],
        dateIn: ['', [Validators.required]],
        dateOut: ['', [Validators.required]],
      },
      {
        validators: [this.dateValidator('dateIn', 'dateOut'),
          this.dateValidator('dateIn', 'dateOut')]
      });

    this.formEdit = this.fb.group({
        id: [],
        cageId: ['', [Validators.required]],
        isSick: ['', [Validators.required]],
        weight: ['', [Validators.required]],
        dateIn: ['', [Validators.required]],
        dateOut: ['', [Validators.required]]
      },
      {
        validators: [this.dateValidator('dateIn', 'dateOut'),
          this.dateValidator('dateIn', 'dateOut')]
      });
  }

  dateValidator(dateIn: string, dateOut: string) {
    return (formGroup: FormGroup) => {
      const control1 = formGroup.controls[dateIn];
      const control2 = formGroup.controls[dateOut];

      if (control1.errors && !control2.errors.confirmedValidator) {
        return;
      }

      if (control1.value > control2.value) {
        control2.setErrors({dateValidator: true});
      } else {
        control2.setErrors(null);
      }
    };
  }

  editModal(id: number) {
    this.id = id;
    this.animalService.findById(this.id).subscribe(animalEdit => {
      this.formEdit.patchValue(animalEdit);
    });
    this.formEdit.reset();
  }

  deleteMultiple() {
    for (const i of this.deletes) {
      this.delete(i);
    }
    this.deletes = [];
  }

  multiDelete(id) {
    // tslint:disable-next-line:triple-equals
    if (this.deletes.find(x => x == id )) {
      this.deletes.splice(this.deletes.indexOf(id), 1);
    } else {
      this.deletes.push(id);
    }
  }

  onSubmit() {
    this.animalCreate = this.formCreate.value;
    if (this.formCreate.get('isSick').value === '1') {
      this.animalCreate.isSick = 1;
    } else {
      this.animalCreate.isSick = 0;
    }
    this.animalService.create(this.animalCreate).subscribe(() => {
      this.getAll(this.indexPagination);
      this.toastr.success('Thêm mới thành công.', 'Thông báo');
    }, error => {
      this.toastr.error('Thêm mới thất bại.', 'Thông báo');
    });
    this.formCreate.reset();
  }

  onSubmitEdit(id: number) {
    this.animalEdit = this.formEdit.value;
    if (this.formEdit.get('isSick').value === '1') {
      this.animalEdit.isSick = 1;
    } else {
      this.animalEdit.isSick = 0;
    }
    this.animalService.update(id, this.animalEdit).subscribe(() => {
      this.getAll(this.indexPagination);
      this.toastr.success('Chỉnh sửa thành công.', 'Thông báo');
    }, error => {
      this.toastr.error('Chỉnh sửa thất bại.', 'Thông báo');
    });
  }

  getAll(indexPagination) {
    this.animalService.getAll(indexPagination).subscribe(
      data => {
        this.animal = data;
        console.log(data);
      });
  }

  changeId(id: number) {
    this.id = id;
  }

  delete(id: number) {
    this.animalService.delete(id).subscribe(() => {
      this.toastr.success('Đã xóa thành công.', 'Thông báo');
      if (this.animal.numberOfElements === 1) {
        this.indexPagination = this.indexPagination - 1;
      }
      this.getAll(this.indexPagination);
    }, error => {
      this.toastr.error('Xóa thất bại.', 'Thông báo');
    });
  }


  firstPage() {
    this.indexPagination = 0;
    this.ngOnInit();
  }

  nextPage() {
    this.indexPagination = this.indexPagination + 1;
    if (this.indexPagination >= this.animal.totalPages) {
      this.indexPagination = this.indexPagination - 1;
    }
    this.ngOnInit();
  }

  previousPage() {
    this.indexPagination = this.indexPagination - 1;
    // tslint:disable-next-line:triple-equals
    if (this.indexPagination == -1) {
      this.indexPagination = 0;
    }
    this.ngOnInit();
  }

  previousTwoPage() {
    this.indexPagination = this.indexPagination - 2;
    if (this.indexPagination < 0) {
      this.indexPagination = 0;
      this.ngOnInit();
    } else {
      this.animalService.getAll(this.indexPagination).subscribe(data => {
        this.animal = data;
      });
    }
  }

  nextTwoPage() {
    this.indexPagination = this.indexPagination + 2;
    if (this.indexPagination >= this.animal.totalPages) {
      this.indexPagination = this.indexPagination - 2;
      this.ngOnInit();
    }
    this.animalService.getAll(this.indexPagination).subscribe(data => {
      this.animal = data;
    });
  }


  lastPage() {
    this.indexPagination = this.animal.totalPages - 1;
    this.ngOnInit();
  }

}

