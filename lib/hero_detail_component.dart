
import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'hero.dart';

@Component(
  selector: 'my-hero-detail',
  template: '''
    <div *ngIf="hero != null">
      <h2>{{hero.name}} details!</h2>
      <div><label>id: </label>{{hero.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="hero.name" placeholder="name">
      </div>
    </div>''',
  directives: const [CORE_DIRECTIVES, FORM_DIRECTIVES]
)

class HeroDetailComponent{
  @Input()
  Hero hero;
}

