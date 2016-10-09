// Copyright (c) 2016, Yuki Urata. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'hero.dart';
import 'hero_detail_component.dart';
import 'hero_service.dart';

@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    template: '''
      <h1>{{title}}</h1>
      <h2>My Heroes</h2>
      <ul class="heroes">
        <li *ngFor="let hero of heroes"
          [class.selected]="hero == selectedHero"
          (click)="onSelect(hero)">
          <span class="badge">{{hero.id}}</span> {{hero.name}}
        </li>
      </ul>
      <my-hero-detail [hero]="selectedHero"></my-hero-detail>
    ''',
    directives: const [CORE_DIRECTIVES, FORM_DIRECTIVES, HeroDetailComponent],
    providers: const [HeroService]
)
class AppComponent implements OnInit{
  final String title = 'Tour of Heroes';
  List<Hero> heroes;
  Hero selectedHero;

  final HeroService _heroService;

  AppComponent(this._heroService);

  Future<Null> getHeroes() async{
    heroes = await _heroService.getHeroes();
  }

  void ngOnInit(){
    getHeroes();
  }

  void onSelect(Hero hero){
    selectedHero = hero;
  }
}
