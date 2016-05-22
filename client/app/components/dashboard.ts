import { Component, OnInit } from '@angular/core';
import { Router }           from '@angular/router-deprecated';

import { Student }        from '../models/student';
import { StudentComponent } from './student';

@Component({
  selector: 'dashboard',
  templateUrl: 'templates/dashboard.component.html',
  styleUrls: ['stylesheet/dashboard.component.css'],
  directives: [StudentComponent]
})

export class DashboardComponent implements OnInit {

  student: Student;

  constructor(
    private _router: Router) {
  }

  ngOnInit() {
    console.log('INIT')
    /*this._heroService.getHeroes()
      .then(heroes => this.heroes = heroes.slice(1,5));*/
  }

  /*gotoDetail(hero: Hero) {
    let link = ['HeroDetail', { id: hero.id }];
    this._router.navigate(link);
  }*/
}