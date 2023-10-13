import UserData from './UserData';

export default class UserDataSource {
  private dataArray: Array<UserData> = []

  private initialData: any[] = [
    { 'name': 'Shanavas Shaji', 'username': 'shanavas.shaji', 'image': $r('app.media.shanavas') },
    { 'name': 'Victoria Maslova', 'username': 'victoria.maslova', 'image': $r('app.media.dummy_user') },
    { 'name': 'Alexey Smolyaninov', 'username': 'alexey.smolyaninov', 'image': $r('app.media.dummy_user') },
    { 'name': 'Sarath Singapati', 'username': 'sarath.singapati', 'image': $r('app.media.dummy_user') },
    { 'name': 'Sanib Nazar', 'username': 'sanib.nazar', 'image': $r('app.media.sanib') },
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