import UserData from './UserData';

export default class UserDataSource {
  private dataArray: Array<UserData> = []

  private initialData: any[] = [
    { 'name': 'Shanavas Shaji', 'username': 'shanavas.shaji', 'image': $r('app.media.shanavas') },
    { 'name': 'Victoria Maslova', 'username': 'victoria.maslova', 'image': $r('app.media.dummy_user') },
    { 'name': 'Alexey Smolyaninov', 'username': 'alexey.smolyaninov', 'image': $r('app.media.alexey') },
    { 'name': 'Tatu Tomppo', 'username': 'tatu.tomppo', 'image': $r('app.media.dummy_user') },
    { 'name': 'Sarath Singapati', 'username': 'sarath.singapati', 'image': $r('app.media.dummy_user') },
    { 'name': 'Oleg Beletski', 'username': 'oleg.beletski', 'image': $r('app.media.dummy_user') },
    { 'name': 'Vidhya Priya', 'username': 'vidhya.priya', 'image': $r('app.media.dummy_user') },
  ]

  constructor() {
    this.initialData.forEach(item => {
      this.dataArray.push(new UserData(item.name, item.username, item.image));
    })
  }

  public getData(): Array<UserData> {
    return this.dataArray
  }
}