import UserData from './UserData';

export default class UserDataSource {
  private dataArray: Array<UserData> = []
  private username: string

  private initialData: any[] = [
    { 'name': 'Shanavas Shaji', 'username': 'shanavas.shaji', 'image': $r('app.media.shanavas') },
    { 'name': 'Victoria Maslova', 'username': 'victoria.maslova', 'image': $r('app.media.victoria') },
    { 'name': 'Alexey Smolyaninov', 'username': 'alexey.smolyaninov', 'image': $r('app.media.alexey') },
    { 'name': 'Tatu Tomppo', 'username': 'tatu.tomppo', 'image': $r('app.media.dummy_user') },
    { 'name': 'Sarath Singapati', 'username': 'sarath.singapati', 'image': $r('app.media.dummy_user') },
    { 'name': 'Oleg Beletski', 'username': 'oleg.beletski', 'image': $r('app.media.dummy_user') },
    { 'name': 'Vidhya Priya', 'username': 'vidhya.priya', 'image': $r('app.media.dummy_user') },
  ]

  constructor(username: string) {
    this.initialData.forEach(item => {
      this.dataArray.push(new UserData(item.name, item.username, item.image));
    })
    this.username = username
  }

  public getData(): Array<UserData> {
    return this.dataArray.filter(item => (item.username !== this.username))
  }

  public isUserRegistered(): Boolean {
    return this.dataArray.filter(item => (item.username === this.username)).length > 0
  }

  public getUser(): UserData {
    const users: Array<UserData> =  this.dataArray.filter(item => (item.username === this.username))
    if(users.length > 0) {
      return users[0];
    }
    else {
      // @ts-ignore
      return new UserData("Guest", this.username, $r('app.media.dummy_user'))
    }
  }
}