import { Injectable }    from '@angular/core';
import { Http, Headers } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Student } from '../models/student';

@Injectable()
export class StudentService {

  private studentsUrl = 'http://192.168.16.166:3000/student';  // URL to web api

  constructor(private http: Http) { }

  getStudents(): Promise<Student[]> {
    return this.http.get(this.studentsUrl)
               .toPromise()
               .then(response => response.json().response)
               .catch(this.handleError);
  }

  getStudent(id: number) {
    return this.getStudents()
               .then(students => students.filter(student => student.id === id)[0]);
  }

  save(student: Student): Promise<Student>  {
    if (student.id) {
      return this.put(student);
    }
    return this.post(student);
  }

    // Add new Student
  private post(student: Student): Promise<Student> {
    let headers = new Headers({
      'Content-Type': 'application/json'});

    return this.http
               .post(this.studentsUrl, JSON.stringify(student), {headers: headers})
               .toPromise()
               .then(res => res.json().data)
               .catch(this.handleError);
  }

  // Update existing Student
  private put(student: Student) {
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');

    let url = `${this.studentsUrl}/${student.id}`;

    return this.http
               .put(url, JSON.stringify(student), {headers: headers})
               .toPromise()
               .then(() => student)
               .catch(this.handleError);
  }

  private handleError(error: any) {
    console.error('An error occurred', error);
    return Promise.reject(error.message || error);
  }
}