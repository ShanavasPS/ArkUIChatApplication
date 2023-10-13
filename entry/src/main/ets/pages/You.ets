// Second.ets
import router from '@ohos.router';
import { AppColors } from '../model/common';
import UserData from '../model/UserData';

@Component
export default struct You {
  controller: TextInputController = new TextInputController()

  @Consume private users: Array<UserData>

  @StorageLink("persistedUser") persistedUser: string = "None";

  registeredUser: Boolean = this.users.filter(item => (item.username === this.persistedUser)).length > 0

  private user: UserData;

  aboutToAppear() {
    if(this.registeredUser) {
      this.user = this.users.filter(item => (item.username === this.persistedUser))[0]
    }
  }

  build() {
      Column() {
        Blank()
          .height(1)
          .width('100%')
          .backgroundColor(AppColors.separator)
          .align(Alignment.Top)
        Row() {
          Column() {
            Image(this.registeredUser ? this.user.image : $r('app.media.dummy_user'))
              .width(100)
              .height(100)
            Text(this.persistedUser)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Black)
              .margin({top: 8})
            Button() {
              Text('Logout')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
            }
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('40%')
            .height('5%')
            .onClick(() => {
              PersistentStorage.deleteProp("persistedUser");
              router.back()
            })
          }.width('100%')
        }
        .height('100%')
        .alignItems(VerticalAlign.Center)
        .alignSelf(ItemAlign.Center)
      }
    }
}

