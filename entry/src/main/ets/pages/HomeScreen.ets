import { AppColors } from '../model/common';
import You from './You';
import Chats from './Chats';
import Updates from './Updates';
import UserData from '../model/UserData';
import UserDataSource from '../model/UserDataModel'

class A {
  text:string=''
  num:number=0
  image:Resource=$r('app.media.icon')
  image_selected:Resource=$r('app.media.icon')
}

@Entry
@Component
struct HomeScreen {
  datasource: UserDataSource = new UserDataSource()
  @Provide users: Array<UserData> = this.datasource.getData()

  @StorageLink("persistedUser") persistedUser: string = "None";

  registeredUser: Boolean = this.users.filter(item => (item.username === this.persistedUser)).length > 0

  private user: UserData;

  @State currentIndex: number = 0
  @State title: string = "Updates"
  @State Build: Array<Object> = [
    {
      text: 'Updates',
      num: 0,
      image: $r('app.media.updates'),
      image_selected: $r('app.media.updates_selected'),
    } as A,
    {
      text: 'Chats',
      num: 1,
      image: $r('app.media.chats'),
      image_selected: $r('app.media.chats_selected'),
    } as A,
    {
      text: 'You',
      num: 2,
      image: $r('app.media.settings'),
      image_selected: $r('app.media.settings_selected'),
    } as A
  ]

  aboutToAppear() {
    console.log("Inside homescreen abouttoappear")
    console.log("Persisted user is " + this.persistedUser)
    console.log(this.users.length.toString())
    if(this.registeredUser) {
      console.log("Found a registered user ")
      this.user = this.users.filter(item => (item.username === this.persistedUser))[0]
      console.log("He or She is " + this.user.username)
    }
  }

  @Builder NavigationTitle() {
    Column() {
      Text(this.title)
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
    }.translate({ x: 20})
  }

  @Builder NavigationMenus() {
    Row() {
      Image(this.registeredUser ? this.user.image : $r('app.media.dummy_user'))
        .width(48)
        .height(48)
        .borderRadius(24)
    }
    .margin({top: 10, right: 10})
  }

  @Builder NavigationToolbar() {
    Flex({alignItems: ItemAlign.Center}) {
      ForEach(this.Build, (item:A) => {
        Column() {
          Blank()
            .height(1)
            .backgroundColor('#ECEFF1')
          Image(this.currentIndex == item.num ? item.image_selected : item.image)
            .width(24)
            .height(24)
            .margin({ top: 6 })
          Text(item.text)
            .fontColor(this.currentIndex == item.num ? '#339AF0' : '#000000')
            .fontSize(10)
            .lineHeight(14)
            .fontWeight(500)
            .margin({ top: 3 })
        }.width('33%').height(56)
        .onClick(() => {
          this.currentIndex = item.num
          this.title = item.text;
        })
      })
    }
    .backgroundColor(AppColors.bottomBar)
  }

  build() {
    Column() {
      Navigation() {
        if(this.currentIndex == 2) {
          You()
        } else if(this.currentIndex == 1) {
          Chats()
        } else {
          Updates()
        }
      }
      .title(this.NavigationTitle)
      .menus(this.NavigationMenus)
      .titleMode(NavigationTitleMode.Full)
      .toolBar(this.NavigationToolbar)
      .hideTitleBar(false)
      .hideToolBar(false)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
      })
    }.width('100%').height('100%')
  }
}