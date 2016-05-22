import { Component } from '@angular/core';

import { RouteConfig, ROUTER_DIRECTIVES, ROUTER_PROVIDERS } from '@angular/router-deprecated';

import { DashboardComponent }  from './components/dashboard';
import { StudentService }  from './services/student';

@Component({
  selector: 'my-app',
  templateUrl: 'templates/main.html',
  directives: [ROUTER_DIRECTIVES],
  providers: [
    ROUTER_PROVIDERS
  ]
})

@RouteConfig([
  { path: '/dashboard',  name: 'Dashboard',  component: DashboardComponent, useAsDefault: true },
  //{ path: '/detail/:id', name: 'HeroDetail', component: HeroDetailComponent },
  //{ path: '/heroes',     name: 'Heroes',     component: HeroesComponent }
])

export class AppComponent { }