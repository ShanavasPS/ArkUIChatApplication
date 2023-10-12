// Second.ets
import router from '@ohos.router';
import { AppColors } from '../model/common';

@Entry
@Component
export default  struct You {
  @State message: string = 'Hi, there'
  @State username: string = 'Shanavas Shaji'
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40

  @StorageLink("persistedUser") persistedUser: string = "User 2";

  build() {
      Column() {
        Blank()
          .height(1)
          .width('100%')
          .backgroundColor(AppColors.separator)
          .align(Alignment.Top)
        Row() {
          Column() {
            Image($r('app.media.shanavas'))
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

