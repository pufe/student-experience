import { Component, Input }         from '@angular/core';
import { Router }                   from '@angular/router-deprecated';

import { Student }                  from '../models/student';

@Component({
  selector: 'avatar',
  templateUrl: 'templates/avatar.component.html',
  styleUrls:  ['stylesheet/avatar.component.css'],
})

export class AvatarComponent {

    @Input() student:Student;

    @Input() private studentSprite = {
        bodySprite: {backgroundImage: 'url("images/corpo.png")'},
        hairSprite: null,
        noseSprite: {},
        eyeSprite: {},
        uniformSprite: {}
    };

    constructor(
    private _router: Router) { }

    spriteBaseUrl: string = '/images/sprites';

    updateAvatar() {
        this.studentSprite.hairSprite = 'url(\'/images/sprites/menino/cabelo/01.png\');';// `url('${this.spriteBaseUrl}/${this.student.gender}/cabelo/${this.student.hair_style}.png');`;
            /*bodySprite: {backgroundImage: `url("${this.spriteBaseUrl}/${this.student.gender}/pele/${this.student.skin_color}.png");`},
            hairSprite: {backgroundImage: `url('${this.spriteBaseUrl}/${this.student.gender}/cabelo/${this.student.hair_style}.png');`},
            noseSprite: {backgroundImage: `url('${this.spriteBaseUrl}/${this.student.gender}/nariz/${this.student.nose_style}.png');`},
            eyeSprite: {backgroundImage: `url('${this.spriteBaseUrl}/${this.student.gender}/olhos/${this.student.eye_color}.png');`},
            uniformSprite: {backgroundImage: `url('${this.spriteBaseUrl}/${this.student.gender}/roupa/${this.student.uniform}.png');`}
        }*/
        console.log('UPDATE', this.studentSprite)
    }


}