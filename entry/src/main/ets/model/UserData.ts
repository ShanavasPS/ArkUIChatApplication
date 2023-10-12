
let NextId = 0;

export default class UserData {
  id: string;
  name: string;
  email: string;
  image: string;

  constructor(name: string, email: string, image: string) {
    this.id = `${ NextId++ }`;
    this.name = name;
    this.email = email;
    this.image = image;
  }
}