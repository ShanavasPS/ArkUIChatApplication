// You.ets
import router from '@ohos.router';
import { AppColors } from '../model/common';
import UserData from '../model/UserData';

@Component
export default struct You {
  controller: TextInputController = new TextInputController()

  @Consume private user: UserData;

  build() {
      Column() {
        Blank()
          .height(1)
          .width('100%')
          .backgroundColor(AppColors.separator)
          .align(Alignment.Top)
        Row() {
          Column() {
            Image(this.user.image)
              .width(100)
              .height(100)
            Text(this.user.name)
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

