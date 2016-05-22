import { Component } from '@angular/core';

import { RouteConfig, ROUTER_DIRECTIVES, ROUTER_PROVIDERS } from '@angular/router-deprecated';

import { DashboardComponent }  from './components/dashboard.component';

@Component({
  selector: 'my-app',
  templateUrl: 'templates/main.html',
  directives: [ROUTER_DIRECTIVES],
  providers: [
    ROUTER_PROVIDERS,
    //HeroService,
  ]
})

@RouteConfig([
  { path: '/dashboard',  name: 'Dashboard',  component: DashboardComponent, useAsDefault: true },
  //{ path: '/detail/:id', name: 'HeroDetail', component: HeroDetailComponent },
  //{ path: '/heroes',     name: 'Heroes',     component: HeroesComponent }
])

export class AppComponent { }