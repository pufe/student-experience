import { Component, OnInit } from '@angular/core';
import { Router }           from '@angular/router-deprecated';

//import { Hero }        from './hero';
//import { HeroService } from './hero.service';

@Component({
  selector: 'dashboard',
  templateUrl: 'templates/dashboard.component.html',
  styleUrls: ['stylesheet/dashboard.component.css']
})

export class DashboardComponent implements OnInit {

  //heroes: Hero[] = [];

  constructor(
    private _router: Router
    /*private _heroService: HeroService*/) {
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