import { Component, AfterViewInit, ViewChild } from '@angular/core';
import { Router }            from '@angular/router-deprecated';

import { Student }                from '../models/student';
import { StudentService }         from '../services/student';
import { AvatarComponent }        from './avatar';

@Component({
  selector: 'student',
  templateUrl: 'templates/student.component.html',
  styleUrls:  ['stylesheet/student.component.css'],
  providers: [StudentService],
  directives: [AvatarComponent]  
})

export class StudentComponent implements AfterViewInit {
  
  @ViewChild(AvatarComponent) avatarComponent:AvatarComponent;
  
  students: Student[];
  selectedStudent: Student;
  addingStudent = false;
  error: any;

  constructor(
    private _router: Router,
    private _studentService: StudentService) { 
  }

  getStudents() {
    this._studentService
        .getStudents()
        .then(student => this.students = student)
        .catch(error => this.error = error); // TODO: Display error message
  }

  getStudent(id: number) {
    this._studentService.getStudent(id).then(student => {
      this.selectedStudent = student;
      this.updateAvatar();
    });
  }

  updateAvatar() {
    this.avatarComponent.student = this.selectedStudent;

    console.log('=======', this.avatarComponent, this.avatarComponent.student)
    this.avatarComponent.updateAvatar();
  }

  addStudent() {
    this.addingStudent = true;
    this.selectedStudent = null;
  }

  close(savedStudent: Student) {
    this.addingStudent = false;
    if (savedStudent) { this.getStudents(); }
  }

  delete(student: Student, event: any) {
    
  }

  ngAfterViewInit() {
    console.log('INIT Student comp')
    this.getStudent(2)
  }

  onSelect(student: Student) {
    this.selectedStudent = student;
    this.addingStudent = false;
  }

  gotoDetail() {
    this._router.navigate(['StudentDetail', { id: this.selectedStudent.id }]);
  }
}