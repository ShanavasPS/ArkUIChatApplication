import router from '@ohos.router';

class A {
  text:string=''
  num:number=0
}

import MySlider from './TextComponent';
import You from './You';
import Chats from './Chats';
import Updates from './Updates';

@Entry
@Component
struct HomeScreen {
  @State currentIndex: number = 0
  @State title: string = "Updates"
  @State Build: Array<Object> = [
    {
      text: 'Updates',
      num: 0
    } as A,
    {
      text: 'Chats',
      num: 1
    } as A,
    {
      text: 'You',
      num: 2
    } as A
  ]

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
      Image($r('app.media.shanavas'))
        .width(48)
        .height(48)
        .borderRadius(24)
    }
    .margin({top: 10, right: 10})
  }

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.Build, (item:A) => {
        Column() {
          Image(this.currentIndex == item.num ? 'common/public_icon_selected.svg' : 'common/public_icon.svg')
            .width(24)
            .height(24)
          Text(item.text)
            .fontColor(this.currentIndex == item.num ? '#007DFF' : '#182431')
            .fontSize(10)
            .lineHeight(14)
            .fontWeight(500)
            .margin({ top: 3 })
        }.width(104).height(56)
        .onClick(() => {
          this.currentIndex = item.num
          this.title = item.text;
        })
      })
    }.margin({ left: 24 })
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
    }.width('100%').height('100%').backgroundColor(Color.Green)
  }
}