import UserData from './UserData';

const UserComposition: any[] = [
  { 'name': 'Shanavas Shaji', 'email': 'shanavas.shaji@huawei.com', 'image': $r('app.media.shanavas') },
  { 'name': 'Victoria Maslova', 'email': 'victoria.maslova@huawei.com', 'image': $r('app.media.dummy_user') },
  { 'name': 'Alexey Smolyaninov', 'email': 'alexey.smolyaninov@huawei.com', 'image': $r('app.media.dummy_user') },
  { 'name': 'Sarath Singapati', 'email': 'sarath.singapati@huawei.com', 'image': $r('app.media.dummy_user') },
  { 'name': 'Sanib Nazar', 'email': 'sanib.nazar@huawei.com', 'image': $r('app.media.sanib') },
]

export function initializeOnStartup(): Array<UserData> {
  let UserDataArray: Array<UserData> = []
  UserComposition.forEach(item => {
    UserDataArray.push(new UserData(item.name, item.email, item.image));
  })
  return UserDataArray;
}

export default class UserDataSource {
  private dataArray: Array<UserData> = []

  private initialData: any[] = [
    { 'name': 'Shanavas Shaji', 'email': 'shanavas.shaji@huawei.com', 'image': $r('app.media.shanavas') },
    { 'name': 'Victoria Maslova', 'email': 'victoria.maslova@huawei.com', 'image': $r('app.media.dummy_user') },
    { 'name': 'Alexey Smolyaninov', 'email': 'alexey.smolyaninov@huawei.com', 'image': $r('app.media.dummy_user') },
    { 'name': 'Sarath Singapati', 'email': 'sarath.singapati@huawei.com', 'image': $r('app.media.dummy_user') },
    { 'name': 'Sanib Nazar', 'email': 'sanib.nazar@huawei.com', 'image': $r('app.media.sanib') },
  ]

  constructor() {
    this.initialData.forEach(item => {
      this.dataArray.push(new UserData(item.name, item.email, item.image));
    })
  }

  public getData(): Array<UserData> {
    return this.dataArray
  }
}