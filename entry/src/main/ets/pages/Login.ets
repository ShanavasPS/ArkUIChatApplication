// Second.ets
import router from '@ohos.router';
import MySlider from './TextComponent';
import { AppColors } from '../model/common';

PersistentStorage.persistProp("persistedUser", "None");

@Entry
@Component
struct Second {
  @State message: string = 'Hi, there'
  @State username: string = ''
  @State password: string = ''
  controller: TextInputController = new TextInputController()
  @State outSetValueOne: number = 40

  @StorageLink("persistedUser") persistedUser: string = "None";

  aboutToAppear() {
    if(this.persistedUser == "None") {
      console.log("Nobody has logged in yet")
    } else {
      console.log(this.persistedUser + " had already logged in, so go to homepage")
      router.pushUrl({ url: 'pages/HomeScreen' })
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        TextInput({ text: this.username, placeholder: 'enter your username...', controller: this.controller })
          .placeholderFont({ size: 14, weight: 400 })
          .width(320).height(40).offset({y: 0})
          .fontSize(14).fontColor(Color.Black)
          .backgroundColor(AppColors.textBox)
          .onChange((value: string) => {
            this.username = value
          })
          .margin(20)
        TextInput({ text: this.password, placeholder: 'enter you password...', controller: this.controller })
          .placeholderFont({ size: 14, weight: 400 })
          .width(320).height(40).offset({y: 0})
          .fontSize(14).fontColor(Color.Black)
          .backgroundColor(AppColors.textBox)
          .type(InputType.Password)
          .onChange((value: string) => {
            this.password = value
          })
          .margin(20)
        Button() {
          Text('Login')
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
          console.log("The user who just logged in is " + this.username)
          this.persistedUser = this.username
          router.pushUrl({ url: 'pages/HomeScreen' })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

